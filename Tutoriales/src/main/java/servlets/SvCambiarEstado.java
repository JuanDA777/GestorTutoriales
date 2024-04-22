/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import com.mycompany.tutoriales.GestionarTutorial;
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
@WebServlet(name = "SvCambiarEstado", urlPatterns = {"/SvCambiarEstado"})
public class SvCambiarEstado extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvCambiarEstado</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvCambiarEstado at " + request.getContextPath() + "</h1>");
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
    int idTutorial = Integer.parseInt(request.getParameter("idTutorial"));

    // Obtén el estado actual del tutorial
    String estadoActual = GestionarTutorial.obtenerEstadoTutorial(idTutorial);

    // Cambia el estado del tutorial según su estado actual
    String nuevoEstado = "";
    if (estadoActual.equals("por revisar")) {
        nuevoEstado = "revisado";
    } else if (estadoActual.equals("revisado")) {
        nuevoEstado = "por revisar";
    }

    // Llama al método en GestionarTutorial para cambiar el estado del tutorial
    boolean exito = GestionarTutorial.cambiarEstadoTutorial(idTutorial, nuevoEstado);

    if (exito) {
        response.getWriter().write("success"); // Envía una respuesta al cliente indicando que el cambio de estado fue exitoso
    } else {
        response.getWriter().write("error"); // Envía una respuesta al cliente indicando que hubo un error
    }
}



    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
