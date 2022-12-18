package com.example.demotest.servlets;

import com.example.demotest.entities.Order;
import com.example.demotest.repositories.MainRepository;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "OrderListServlet", value = "/order-list")
public class OrderListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MainRepository mainRepository = new MainRepository();
        if (request.getParameter("orderNumber").matches("[0-9]+")) {
            Integer orderNumber = Integer.valueOf(request.getParameter("orderNumber"));
            request.setAttribute("selectedOrder", mainRepository.find(Order.class, orderNumber));
        }
        getServletContext().getRequestDispatcher("/order-listing.jsp").forward(request, response);
    }
}
