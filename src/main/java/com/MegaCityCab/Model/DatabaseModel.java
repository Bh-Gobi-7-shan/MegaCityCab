package com.MegaCityCab.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.MegaCityCab.Service.DataBase;

public class DatabaseModel {
    static Connection conn = null;

    public static void createTable() {
        String createQuestionDetailsTable = "CREATE TABLE IF NOT EXISTS questions ("
                + "email VARCHAR(100) NOT NULL, "
                + "name VARCHAR(100) NOT NULL, "
                + "subject VARCHAR(255) NOT NULL, "
                + "message TEXT NOT NULL, "
                + "posted_at DATETIME DEFAULT CURRENT_TIMESTAMP, "
                + "PRIMARY KEY (email, name)"
                + ");";

        String createUserTable = "CREATE TABLE IF NOT EXISTS users ("
                + "nic_number VARCHAR(12) UNIQUE NOT NULL PRIMARY KEY, "
                + "password VARCHAR(20) NOT NULL, "
                + "role_admin ENUM('Y', 'N') NOT NULL DEFAULT 'N'"
                + ");";

        String createUserSessionTable = "CREATE TABLE IF NOT EXISTS session ("
                + "session_id VARCHAR(20) UNIQUE NOT NULL PRIMARY KEY, "
                + "nic_number VARCHAR(12) UNIQUE NOT NULL PRIMARY KEY, "
                + "role_admin ENUM('Y', 'N') NOT NULL DEFAULT 'N'"
                + ");";

        String createUserDetailsTable = "CREATE TABLE IF NOT EXISTS details ("
                + "nic_number VARCHAR(12) UNIQUE NOT NULL PRIMARY KEY, "
                + "first_name VARCHAR(100) NOT NULL, "
                + "last_name VARCHAR(100) NOT NULL, "
                + "phone_number VARCHAR(10) NOT NULL, "
                + "gender ENUM('male', 'female') NOT NULL, "
                + "registration_date DATETIME DEFAULT CURRENT_TIMESTAMP"
                + ");";

        // they are maintained by admin not by the system
        String createDriverTable = "CREATE TABLE IF NOT EXISTS Drivers ("
                + "driver_id INT AUTO_INCREMENT PRIMARY KEY, "
                + "first_name VARCHAR(100) NOT NULL,"
                + "last_name VARCHAR(100) NOT NULL,"
                + "nic_number VARCHAR(12) UNIQUE NOT NULL,"
                + "license_number VARCHAR(15) UNIQUE NOT NULL, "
                + "phone_number VARCHAR(10) NOT NULL, "
                + "gender ENUM('male', 'female') NOT NULL,"
                + "date_of_birth DATE NOT NULL, "
                + "address TEXT NOT NULL, "
                + "driver_image BLOB, "
                + "appointment_date DATETIME NOT NULL, "
                + "current_status ENUM('Working', 'Not Working') NOT NULL, "
                + "termination_date DATETIME"
                + ");";

        // Also need to create employees and terminated employees

        try {
            conn = DataBase.getConnection();
            Statement stmt = conn.createStatement();

            stmt.executeUpdate(createQuestionDetailsTable);
            stmt.executeUpdate(createUserTable);
            stmt.executeUpdate(createUserDetailsTable);
            //stmt.executeUpdate(createDriverTable);

            System.out.println("Tables created successfully.");
        }
        catch (SQLException e) {
            System.err.println("DB Model ERROR: " + e.getMessage());
        }
    }

}
