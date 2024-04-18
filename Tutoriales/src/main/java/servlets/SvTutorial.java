/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import com.mycompany.tutoriales.GestionarTutorial;
import static com.mycompany.tutoriales.GestionarTutorial.insertarTutorial;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author juand
 */
@WebServlet(name = "SvTutorial", urlPatterns = {"/SvTutorial"})
public class SvTutorial extends HttpServlet {

    GestionarTutorial tutorial = new GestionarTutorial();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvTutorial</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvTutorial at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         int idTutorial = Integer.parseInt(request.getParameter("idTutorial"));
         GestionarTutorial.eliminarTutorial(idTutorial);
         response.sendRedirect("index.jsp"); // Redirigir a una página de éxito

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String titulo = request.getParameter("titulo");
        int prioridad = Integer.parseInt(request.getParameter("prioridad"));
        String url = request.getParameter("url");
        int categoria = Integer.parseInt(request.getParameter("categoria"));

        // Llamar al método para insertar el tutorial en la base de datos
        boolean exito = insertarTutorial(titulo, prioridad, url, categoria);

        if (exito) {
            // Redirigir a alguna página de éxito o mostrar un mensaje de éxito
            response.sendRedirect("index.jsp"); // Redirigir a una página de éxito
        } else {
            // Mostrar un mensaje de error en la página
            response.getWriter().println("Error al agregar, por favor, intente de nuevo.");
        }
    }



    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
