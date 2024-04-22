/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import com.mycompany.tutoriales.GestionarTutorial;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
@WebServlet(name = "SvEditar", urlPatterns = {"/SvEditar"})
public class SvEditar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvEditar</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvEditar at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener el parámetro 'orden' de la solicitud
        String orden = request.getParameter("orden");

        // Obtener la cadena HTML ordenada
        String html = GestionarTutorial.obtenerTutorialesOrdenados(orden);

        // Configurar la solicitud para redireccionar al nuevo JSP
        request.setAttribute("tablaTutoriales", html);
        request.getRequestDispatcher("/ordenamiento.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del formulario de edición
        String idTutorialStr = request.getParameter("editIdTutorial");
        String titulo = request.getParameter("editTitulo");
        String prioridadStr = request.getParameter("editPrioridad");
        String url = request.getParameter("editUrl");
        String idCategoriaStr = request.getParameter("categoria"); // Cambio aquí

        try {
            // Convertir los parámetros a números enteros
            int idTutorial = Integer.parseInt(idTutorialStr);
            int prioridad = Integer.parseInt(prioridadStr);
            int idCategoria = Integer.parseInt(idCategoriaStr);

            // Actualizar el tutorial en la base de datos
            boolean exito = GestionarTutorial.editarTutorial(idTutorial, titulo, prioridad, url, idCategoria);

            if (exito) {
                // Redirigir a una página de confirmación o a donde necesites
                response.sendRedirect("tutoriales.jsp");
            } else {
                // Manejar el caso de error al editar el tutorial
                response.getWriter().println("Error al editar el tutorial.");
            }
        } catch (NumberFormatException e) {
            // Manejar el caso de parámetros no válidos
            response.getWriter().println("Uno o más parámetros no son números enteros válidos.");
        }

    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
