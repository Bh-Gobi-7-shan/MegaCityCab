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
    private SmsSender sendSms;
    private Connection connection;

    @Override
    public void init() throws ServletException {
        sendSms = new SmsSender();
        connection = DataBase.getConnection();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = (String) req.getAttribute("firstName");
        String lastName = (String) req.getAttribute("lastName");
        String nicNumber = (String) req.getAttribute("nicNumber");
        String phoneNumber = (String) req.getAttribute("phoneNumber");
        String gender = (String) req.getAttribute("gender");
        String password = (String) req.getAttribute("password");
        String otp = (String) req.getAttribute("otp");


        String getOtp = req.getParameter("otp");
        if (getOtp != null && getOtp.equals(otp)){
            // db store related works






            RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/home.jsp");
            dispatcher.forward(req, resp);
        }
    }


}
