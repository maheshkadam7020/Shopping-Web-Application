package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/shop", "root", "0000"
            );
        } catch (Exception e) {
            e.printStackTrace(); // Properly print errors
        }
        return conn;
    }
}
