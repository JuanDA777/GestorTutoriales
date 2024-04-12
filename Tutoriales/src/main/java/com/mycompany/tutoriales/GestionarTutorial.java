/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.tutoriales;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author juand
 */
public class GestionarTutorial {
    public Connection establecerConexion(){
        String url = "jdbc:mysql://localhost:3306/GestorTutorial?serverTimeZone=utc";
        String user = "root";
        String password = "123456";
        Connection conn = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url,user,password);
            if (conn!=null) {
                System.out.println("Conexion exitosa");
            }
        } catch (Exception e) {
            System.out.println("Error de conexion" + e.getMessage());
        }
        return conn;
    }
    public void agregarProducto(){
        
    }
    
    
}
