package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
    public static Connection conn;

    public static Connection getConnect() {
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_ebook","root","");
            
           
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static void main(String[] args) throws SQLException {
        Connection connection = DBConnect.getConnect();
        if(!connection.isClosed())
        {
        	System.out.println("connected..");
        }
    }
}