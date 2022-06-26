/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author cao thi phuong thuy
 */
public class DBUtils {
     public static Connection getConnection() throws SQLException, ClassNotFoundException{
        java.sql.Connection conn=null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url="jdbc:sqlserver://localhost:1433;databaseName=MotelDB";
        conn=DriverManager.getConnection(url,"sa","07112001Thuy");
        return conn;
    }   
   public static void main(String[] args){
       try {
           System.out.println(DBUtils.getConnection());
       } catch (Exception e) {
       }
   }
}