package com.MegaCityCab.Controller;


import com.MegaCityCab.Service.SmsSender;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/resend")
public class Resend extends HttpServlet {
    private SmsSender resendSms;

    @Override
    public void init() throws ServletException {
        resendSms = new SmsSender();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resendOTP(req, resp);
    }


    private void resendOTP(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String phoneNumber = (String) req.getSession().getAttribute("phoneNumber");
        String otp = (String) req.getSession().getAttribute("otp");

        System.out.println("Resend OTP is :" + otp);

        //boolean reSendStatus = resendSms.sendSMS(phoneNumber, "The OTP code For the Signup is : " + otp);
        boolean reSendStatus = true; // need to romove once the above relased

        if (reSendStatus) {
            req.setAttribute("message", "OTP Resend successful!");
            req.setAttribute("type", "success");
        }
        else {
            req.setAttribute("message", "OTP Resend failed. Please try again.");
            req.setAttribute("type", "error");
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("verification.jsp");
        dispatcher.include(req, resp);
    }
}