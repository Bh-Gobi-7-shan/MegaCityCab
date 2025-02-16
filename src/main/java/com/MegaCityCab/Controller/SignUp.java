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
import java.util.Random;

@WebServlet("/signup")
public class SignUp extends HttpServlet {
    private SmsSender sendSms;

    @Override
    public void init() throws ServletException {
        sendSms = new SmsSender();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/signup.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName").trim().toUpperCase();
        String lastName = req.getParameter("lastName").trim().toUpperCase();
        String nicNumber = req.getParameter("nicNumber").trim();
        String phoneNumber = req.getParameter("phonenumber").trim();
        String gender = req.getParameter("gender").trim(); // male ,female
        String password = req.getParameter("password").trim();


        String otp = generateOtp();
        //boolean status = sendSms.sendSMS(phoneNumber, "The OTP code For the Signup is : " + otp);
        boolean status = true; // need to romove once the above relased

        if (status){
            req.getSession().setAttribute("firstName", firstName);
            req.getSession().setAttribute("lastName", lastName);
            req.getSession().setAttribute("nicNumber", nicNumber);
            req.getSession().setAttribute("phoneNumber", phoneNumber);
            req.getSession().setAttribute("gender", gender);
            req.getSession().setAttribute("password", password);
            req.getSession().setAttribute("otp", otp);


            RequestDispatcher dispatcher1 = req.getRequestDispatcher("/WEB-INF/views/verification.jsp");
            System.out.println("OTP is :" + otp); // need to remove
            dispatcher1.forward(req, resp);
        }
        else {
            req.setAttribute("error", "Failed to send OTP. Please try again.");
            RequestDispatcher dispatcher2 = req.getRequestDispatcher("/WEB-INF/views/signup.jsp");
            dispatcher2.forward(req, resp);
        }
    }
    @Override
    public void destroy() {
        DataBase.closeConnection();
    }

    public static String generateOtp() {
        Random random = new Random();
        int otpNumber = 100000 + random.nextInt(900000);
        return String.format("%06d", otpNumber);
    }
}