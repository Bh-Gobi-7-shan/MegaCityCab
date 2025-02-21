package com.MegaCityCab.Model;

import com.MegaCityCab.Service.DataBase;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class StoreData {
    static Connection conn = null;

    public static boolean storeUser(String nic, String password, String adminRole) {
        String sql = "INSERT INTO Users (nic_number, password, role_admin) VALUES (?, ?, ?)";
        try {
            conn = DataBase.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, nic);
            statement.setString(2, password);
            statement.setString(3, adminRole.toUpperCase());

            int successful = statement.executeUpdate();
            return successful > 0;
        }
        catch (Exception e) {
            System.err.println("DB Model ERROR in storeUser method: " + e.getMessage());
            return false;
        }
    }

    public static boolean storeUserDetails(String nic, String firstName, String lastName, String phoneNumber, String gender) {
        String sql = "INSERT INTO Details (nic_number, first_name, last_name, phone_number, gender) VALUES (?, ?, ?, ?, ?)";
        try {
            conn = DataBase.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, nic);
            statement.setString(2, firstName);
            statement.setString(3, lastName);
            statement.setString(4, phoneNumber);
            statement.setString(5, gender.toLowerCase());

            int successful = statement.executeUpdate();
            return successful > 0;
        }
        catch (Exception e) {
            System.err.println("DB Model ERROR in storeUserDetails method: " + e.getMessage());
            return false;
        }
    }

    public static boolean storeDriverDetails(String firstName, String lastName, String nic, String licenseNumber,
                                             String phoneNumber, String gender, String dateOfBirth, String address,
                                             byte[] driverImage, String appointmentDate, String currentStatus) {

        String sql =    "INSERT INTO Drivers (first_name, last_name, nic_number, license_number, phone_number, gender, "
                + "date_of_birth, address, driver_image, appointment_date, current_status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            conn = DataBase.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, firstName);
            statement.setString(2, lastName);
            statement.setString(3, nic);
            statement.setString(4, licenseNumber);
            statement.setString(5, phoneNumber);
            statement.setString(6, gender.toLowerCase());
            statement.setString(7, dateOfBirth);
            statement.setString(8, address);
            statement.setBytes(9, driverImage);
            statement.setString(10, appointmentDate);
            statement.setString(11, currentStatus);

            int successful = statement.executeUpdate();
            return successful > 0;
        }
        catch (Exception e) {
            System.err.println("DB Model ERROR in storeDriverDetails method: " + e.getMessage());
            return false;
        }
    }
}
