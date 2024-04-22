package com.mycompany.tutoriales;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class GestionarCategoria {
    public static Connection establecerConexion() {
        String url = "jdbc:mysql://localhost:3306/GestorTutorial?serverTimeZone=utc";
        String user = "root";
        String password = "123456";
        Connection conn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            if (conn != null) {
                System.out.println("Conexion exitosa");
            }
        } catch (Exception e) {
            System.out.println("Error de conexion" + e.getMessage());
        }
        return conn;
    }

    public static void agregarCategoria(String categoria) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Obtener la conexión a la base de datos
            conn = GestionarCategoria.establecerConexion();

            // Consulta SQL para insertar la nueva categoría
            String sql = "CALL InsertarCategoria(?)";

            // Preparar la declaración SQL
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, categoria);

            // Ejecutar la consulta
            stmt.executeUpdate();

            System.out.println("Categoría agregada exitosamente");
        } catch (SQLException e) {
            System.out.println("Error al agregar categoría: " + e.getMessage());
        } finally {
            // Cerrar el PreparedStatement y la conexión
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println("Error al cerrar la conexión: " + e.getMessage());
            }
        }
    }

    public static String obtenerCategorias() {
        StringBuilder html = new StringBuilder();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Obtener la conexión a la base de datos
            conn = GestionarCategoria.establecerConexion();

            // Consulta SQL para obtener todas las categorías con sus IDs
            String sql = "SELECT idCategoria, categoria FROM categoria";

            // Preparar la declaración SQL
            stmt = conn.prepareStatement(sql);

            // Ejecutar la consulta
            rs = stmt.executeQuery();

            // Construir la tabla HTML con las categorías y sus IDs
            while (rs.next()) {
                int idCategoria = rs.getInt("idCategoria");
                String categoria = rs.getString("categoria");

                html.append("<tr>");
                html.append("<td>").append(idCategoria).append("</td>");
                html.append("<td>").append(categoria).append("</td>");
                html.append("<td>");
                html.append("<button type=\"button\" class=\"btn btn-primary btn-sm\" data-toggle=\"modal\" data-target=\"#editModal").append(idCategoria).append("\">Editar</button>");
                
                html.append("</td>");
                html.append("<td>");
                html.append("<button type=\"button\" class=\"btn btn-danger btn-sm\" onclick=\"eliminarCategoria(").append(idCategoria).append(")\">Eliminar</button>");
                html.append("</td>");
                html.append("</tr>");
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener categorías: " + e.getMessage());
        } finally {
            // Cerrar el ResultSet, PreparedStatement y la conexión
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println("Error al cerrar la conexión: " + e.getMessage());
            }
        }

        return html.toString();
    }

}
