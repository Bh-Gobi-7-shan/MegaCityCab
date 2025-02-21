package com.MegaCityCab.Controller;


import com.MegaCityCab.Service.DataBase;
import com.MegaCityCab.Service.SmsSender;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

@WebServlet("/verification")
public class Verification extends HttpServlet {
    private Connection connection;

    @Override
    public void init() throws ServletException {
        connection = DataBase.getConnection();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/verification.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = (String) req.getSession().getAttribute("firstName");
        String lastName = (String) req.getSession().getAttribute("lastName");
        String nicNumber = (String) req.getSession().getAttribute("nicNumber");
        String phoneNumber = (String) req.getSession().getAttribute("phoneNumber");
        String gender = (String) req.getSession().getAttribute("gender");
        String password = (String) req.getSession().getAttribute("password");
        String otp = (String) req.getSession().getAttribute("otp");

        String getOtp = req.getParameter("otp");

        if (getOtp != null && getOtp.equals(otp)){
            // db store related works
            System.err.println("matched");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/home");
            dispatcher.forward(req, resp);
        }
        else {
            System.err.println("OTP mismatch. Redirecting back to verification.");
            req.setAttribute("error", "Invalid OTP. Please try again.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/verification.jsp");
            dispatcher.forward(req, resp);
        }
    }


}
