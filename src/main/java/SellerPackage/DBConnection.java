package SellerPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/sellermanagementsystem";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = ""; // Add your password if any

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
        } catch (ClassNotFoundException e) {
            System.out.println("❌ JDBC Driver not found");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("❌ Failed to connect to DB");
            e.printStackTrace();
        }
        return null;
    }
}
