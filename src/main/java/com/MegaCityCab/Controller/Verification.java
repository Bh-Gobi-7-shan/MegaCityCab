package com.MegaCityCab.Controller;

import com.MegaCityCab.Model.StoreData;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/verification")
public class Verification extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = (String) req.getSession().getAttribute("firstName");
        String lastName = (String) req.getSession().getAttribute("lastName");
        String nicNumber = (String) req.getSession().getAttribute("nicNumber");
        String phoneNumber = (String) req.getSession().getAttribute("phoneNumber");
        String gender = (String) req.getSession().getAttribute("gender");
        String password = (String) req.getSession().getAttribute("password");
        String otp = (String) req.getSession().getAttribute("otp");

        String verificationJspOtp = req.getParameter("otp");

        if (verificationJspOtp != null && verificationJspOtp.equals(otp)){
            boolean user = StoreData.storeUser(nicNumber,password);
            boolean userDetails = StoreData.storeUserDetails(nicNumber,firstName,lastName,phoneNumber, gender);

            if(user && userDetails){
                resp.sendRedirect("home.jsp");
            }
        }
        else{
            req.setAttribute("error", "Invalid OTP. Please try again.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("verification.jsp");
            dispatcher.forward(req, resp);
        }
    }
}