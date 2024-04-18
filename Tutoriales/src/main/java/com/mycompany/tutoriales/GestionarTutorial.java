/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.tutoriales;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author juand
 */
public class GestionarTutorial {

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

    public static boolean insertarTutorial(String titulo, int prioridad, String url, int categoria) {
        try {
            // Establecer la conexión a la base de datos
            Connection conn = establecerConexion();
            if (conn != null) {
                // Llamar al procedimiento almacenado
                CallableStatement stmt = conn.prepareCall("{call InsertarTutorial(?, ?, ?, ?)}");

                // Establecer parámetros del procedimiento almacenado
                stmt.setString(1, titulo);
                stmt.setInt(2, prioridad);
                stmt.setString(3, url);
                stmt.setInt(4, categoria);

                // Ejecutar el procedimiento almacenado
                stmt.execute();

                // Cerrar la conexión
                conn.close();

                return true;
            } else {
                // Manejar el caso en que no se pueda obtener una conexión a la base de datos
                System.out.println("No se pudo establecer una conexión a la base de datos.");
            }
        } catch (SQLException e) {
            // Manejar cualquier error de SQL
            e.printStackTrace(); // Esto imprimirá la traza de la excepción en la consola del servidor
        }
        return false;
    }

    public static String ObtenerTutoriales() {
        String html = "";
        try {
            // Llamada al método estático de la clase GestionarTutorial
            Connection conn = GestionarTutorial.establecerConexion();
            if (conn != null) {
                String sql = "SELECT t.idTutorial, t.titulo, t.prioridad, c.categoria, t.URL FROM tutorial t JOIN categoria c ON t.idCategoria = c.idCategoria";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    int idTutorial = rs.getInt("idTutorial");
                    String titulo = rs.getString("titulo");
                    int prioridad = rs.getInt("prioridad");
                    String categoria = rs.getString("categoria");
                    String url = rs.getString("URL");
                    
                    int valorCategoria = obtenerValorCategoria(categoria);
                    
                    html += "<tr>";
                    html += "<td>" + titulo + "</td>";
                    html += "<td>" + prioridad + "</td>";
                    html += "<td>" + categoria + "</td>";
                    html += "<td><a href='" + url + "'>Enlace</a></td>";
                    html += "<td><a href=\"#\" class=\"btn btn-primary btn-sm\" data-bs-toggle=\"modal\" data-bs-target=\"#editModal\" title=\"Editar\" "
                        + "data-id=\"" + idTutorial + "\" "
                        + "data-titulo=\"" + titulo + "\" "
                        + "data-prioridad=\"" + prioridad + "\" "
                        + "data-url=\"" + url + "\" "
                        + "data-categoria=\"" + valorCategoria + "\">"
                        + "Editar <i class=\"fas fa-edit\"></i>"
                        + "</a></td>";
                    html += "<td><button type=\"button\" title=\"Eliminar\" class=\"btn btn-danger btn-sm\" onclick=\"confirmarEliminacion(" + idTutorial + ")\">Eliminar <i class=\"fas fa-trash\"></i></button></td>";
                    html += "</tr>";
                    
                }
                
                conn.close();
            } else {
                html = "<tr><td colspan='6'>No se pudo establecer una conexión a la base de datos.</td></tr>";
            }
        } catch (Exception e) {
            html = "<tr><td colspan='6'>Error al obtener los tutoriales: " + e.getMessage() + "</td></tr>";
        }
        return html;
    }

    public static void eliminarTutorial(int idTutorial) {
        try {
            // Establecer conexión a la base de datos
            Connection conn = GestionarTutorial.establecerConexion();
            if (conn != null) {
                // Definir la consulta SQL para eliminar el tutorial
                String sql = "DELETE FROM tutorial WHERE idTutorial = ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, idTutorial);

                // Ejecutar la consulta
                pstmt.executeUpdate();

                // Cerrar la conexión
                conn.close();
            } else {
                System.out.println("No se pudo establecer una conexión a la base de datos.");
            }
        } catch (SQLException e) {
            System.out.println("Error al eliminar el tutorial: " + e.getMessage());
        }
    }

    public static boolean editarTutorial(int idTutorial, String titulo, int prioridad, String url, int idCategoria) {
        try {
            // Establecer la conexión a la base de datos
            Connection conn = establecerConexion();
            if (conn != null) {
                // Llamar al procedimiento almacenado
                CallableStatement stmt = conn.prepareCall("{call EditarTutorial(?, ?, ?, ?, ?)}");

                // Establecer los parámetros del procedimiento almacenado
                stmt.setInt(1, idTutorial);
                stmt.setString(2, titulo);
                stmt.setInt(3, prioridad);
                stmt.setString(4, url);
                stmt.setInt(5, idCategoria);

                // Ejecutar el procedimiento almacenado
                stmt.execute();

                // Cerrar la conexión
                conn.close();

                return true;
            } else {
                // Manejar el caso en que no se pueda obtener una conexión a la base de datos
                System.out.println("No se pudo establecer una conexión a la base de datos.");
            }
        } catch (SQLException e) {
            // Manejar cualquier error de SQL
            e.printStackTrace(); // Esto imprimirá la traza de la excepción en la consola del servidor
        }
        return false;
    }

    // Método para obtener el valor numérico de la categoría a partir de su nombre
    // Método para obtener el valor numérico de la categoría a partir de su nombre
    public static int obtenerValorCategoria(String nombreCategoria) {
        // Mapa para mapear el nombre de la categoría a su valor numérico
        Map<String, Integer> categoriaMap = new HashMap<>();
        categoriaMap.put("Lógica de programación", 1);
        categoriaMap.put("Flutter", 2);
        categoriaMap.put("Node.js", 3);
        categoriaMap.put("Lenguajes de programación", 4);
        categoriaMap.put("Html", 5);
        categoriaMap.put("Bases de datos", 6);
        categoriaMap.put("Matemáticas", 7);
        categoriaMap.put("Geometría", 8);
        categoriaMap.put("Física", 9);
        categoriaMap.put("Instalaciones", 10);
        categoriaMap.put("Juegos", 11);
        categoriaMap.put("Vida cotidiana", 12);


        // Obtener el valor numérico de la categoría a partir de su nombre
        Integer valorCategoria = categoriaMap.get(nombreCategoria);

        // Verificar si se encontró el valor numérico correspondiente
        if (valorCategoria != null) {
            return valorCategoria;
        } else {
            // En caso de que el nombre de la categoría no esté en el mapa, puedes manejarlo de acuerdo a tu lógica, por ejemplo, devolviendo un valor predeterminado o lanzando una excepción
            return -1; // Valor predeterminado en caso de que no se encuentre la categoría
        }
    }



}
