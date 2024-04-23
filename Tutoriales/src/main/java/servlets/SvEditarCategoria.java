/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import com.mycompany.tutoriales.GestionarCategoria;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author juand
 */
@WebServlet(name = "SvEditarCategoria", urlPatterns = {"/SvEditarCategoria"})
public class SvEditarCategoria extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvEditarCategoria</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvEditarCategoria at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String nuevaCategoria = request.getParameter("categoria");
        String idCategoriaParam = request.getParameter("idCategoria");

        // Verificar si idCategoriaParam no es nulo ni vacío
        if (idCategoriaParam != null && !idCategoriaParam.isEmpty()) {
            int idCategoria = Integer.parseInt(idCategoriaParam);
            System.out.println("categoria: " + nuevaCategoria);
            System.out.println("Idcategoria: " + idCategoria);
            // Llamar al método para editar la categoría
            GestionarCategoria.editarCategoria(idCategoria, nuevaCategoria);

            // Redirigir a la página de categoría
            response.sendRedirect("categoria.jsp");
        } else {
            // Manejar el caso en el que idCategoria es nulo o vacío
            // Puedes mostrar un mensaje de error o redirigir a una página de error
            response.sendRedirect("pagina-de-error.jsp");
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
