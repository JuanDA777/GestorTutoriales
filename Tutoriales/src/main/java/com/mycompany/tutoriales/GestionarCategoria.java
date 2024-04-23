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
                html.append( "<td><a href=\"#\" class=\"btn btn-primary btn-sm\" data-bs-toggle=\"modal\" data-bs-target=\"#editarCategoria\" title=\"Editar\" "
                            + "data-id=\"" + idCategoria + "\">"
                            + "Editar <i class=\"fas fa-edit\"></i>"
                            + "</a></td>");
                html.append("</td>");
                html.append("<td>");
                html.append("<button type=\"button\" class=\"btn btn-danger btn-sm\" onclick=\"eliminarCategoria(").append(idCategoria).append(")\">Eliminar <i class=\"fas fa-trash\"></i></button>");
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
    
    public static void eliminarCategoria(int idCategoria) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Obtener la conexión a la base de datos
            conn = GestionarCategoria.establecerConexion();

            // Consulta SQL para eliminar la categoría
            String sql = "CALL EliminarCategoria(?)";

            // Preparar la declaración SQL
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idCategoria);

            // Ejecutar la consulta
            stmt.executeUpdate();

            System.out.println("Categoría eliminada exitosamente");
        } catch (SQLException e) {
            System.out.println("Error al eliminar categoría: " + e.getMessage());
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
    
    public static void editarCategoria(int idCategoria, String nuevaCategoria) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Establecer conexión a la base de datos
            conn = establecerConexion();

            // Consulta SQL para editar la categoría
            String sql = "UPDATE categoria SET categoria = ? WHERE idCategoria = ?";

            // Preparar la declaración SQL
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, nuevaCategoria);
            stmt.setInt(2, idCategoria);

            // Ejecutar la consulta
            int filasActualizadas = stmt.executeUpdate();

            if (filasActualizadas > 0) {
                System.out.println("Categoría actualizada exitosamente");
            } else {
                System.out.println("No se encontró la categoría con el ID proporcionado");
            }
        } catch (SQLException e) {
            System.out.println("Error al editar categoría: " + e.getMessage());
        } finally {
            // Cerrar PreparedStatement y conexión
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

}
