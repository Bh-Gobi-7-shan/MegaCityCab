package com.MegaCityCab.Controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LogIn extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String userName = req.getParameter("username");
        String passWord = req.getParameter("password");
        String reMemberMe = req.getParameter("remember");  // check the null

        if (userName != null && passWord != null) {
            // give the other logic
        }

        // Redirect or forward based on the login status
        // For example: resp.sendRedirect("/dashboard");
    }
}





