package com.example.demotest.servlets;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.example.demotest.entities.Customer;
import com.example.demotest.repositories.CustomerRepository;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AuthenticationServlet", value = "/login")
public class AuthenticationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if ((username == null || username.trim().length() == 0) || (password == null || password.trim().length() == 0)) {
            request.setAttribute("emptyInput", "Username or password is empty");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }

        CustomerRepository customerRepository = new CustomerRepository();
        Customer customer = customerRepository.findByName(username);
        if (customer == null) {
            request.setAttribute("invalidUsername", "User not found");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), customer.getPassword());
            if (!result.verified) {
                request.setAttribute("invalidPassword", "Invalid password");
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            } else {
                request.getSession().setAttribute("user", customer);
                request.setAttribute("customerNumber", customer.getCustomerNumber());
                getServletContext().getRequestDispatcher("/customer-list").forward(request, response);
            }
        }
    }
}
