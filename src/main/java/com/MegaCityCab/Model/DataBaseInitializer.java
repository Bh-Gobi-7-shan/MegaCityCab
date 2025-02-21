package com.MegaCityCab.Model;

import com.MegaCityCab.Service.DataBase;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;


@WebListener
public class DataBaseInitializer implements ServletContextListener {
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Initializing Tables...");
        DatabaseModel.createTable();
        System.out.println("Initialized...");

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        DataBase.closeConnection();
        System.out.println("Shutting down Database...");
    }
}