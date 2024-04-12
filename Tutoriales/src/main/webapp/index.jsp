RI<%-- 
    Document   : index
    Created on : 12 abr 2024, 7:28:43
    Author     : juand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="SvTutorial" method="POST">
            <label for="titulo">Título:</label><br>
            <input type="text" id="titulo" name="titulo" required><br><br>

            <label for="prioridad">Prioridad (1 - 10):</label><br>
            <input type="number" id="prioridad" name="prioridad" min="1" max="10" required><br><br>

            <label for="url">URL de YouTube:</label><br>
            <input type="text" id="url" name="url" required><br><br>

            <label for="categoria">Categoría:</label><br>
            <select id="categoria" name="categoria" required>
                <option value="" disabled selected>-- Selecciona una categoría --</option>
                <option value="1">Lógica de Programación</option>
                <option value="2">Flutter</option>
                <option value="3">Node.js</option>
                <!-- Agrega más opciones de categoría según sea necesario, y asegúrate de asignarles valores numéricos únicos -->
            </select><br><br>

            <input type="submit" value="Agregar Tutorial">
        </form>
    </body>
</html>
