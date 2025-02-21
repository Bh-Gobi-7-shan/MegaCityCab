package com.MegaCityCab.Controller;

import com.MegaCityCab.Model.DatabaseModel;
import com.MegaCityCab.Model.StoreData;
import com.MegaCityCab.Service.SmsSender;
import org.json.JSONObject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/index")
public class Index extends HttpServlet{


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        PrintWriter out = resp.getWriter();

        // Read JSON from request body when we use the fetch API
        StringBuilder jsonString = new StringBuilder();
        String line;
        try (BufferedReader reader = req.getReader()) {
            while ((line = reader.readLine()) != null) {
                jsonString.append(line);
            }
        }
        catch (Exception e){
            System.err.println("Index Page ERROR in json request gathering: " + e.getMessage());
        }

        JSONObject formRequest = new JSONObject(jsonString.toString());

        String name = formRequest.getString("name");
        String email = formRequest.getString("email");
        String subject = formRequest.getString("subject");
        String message = formRequest.getString("message");

        JSONObject jsonResponse = new JSONObject();

        if (StoreData.storeQuestionDetails(name,email,subject,message)) {
            jsonResponse.put("status", "success");
        }
        else {
            jsonResponse.put("status", "error");
        }

        out.print(jsonResponse.toString());
        out.flush();
    }
}