package com.example.demotest.servlets;

import com.example.demotest.entities.Customer;
import com.example.demotest.repositories.MainRepository;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CustomerListServlet", value = "/customer-list")
public class CustomerListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MainRepository mainRepository = new MainRepository();
        if (request.getAttribute("customerNumber") != null) {
            Integer customerNumber = Integer.valueOf(request.getAttribute("customerNumber").toString());
            HttpSession session = request.getSession();
            session.setAttribute("selectedCustomer", mainRepository.find(Customer.class, customerNumber));
        }
        getServletContext().getRequestDispatcher("/order-listing.jsp").forward(request, response);
    }
}