<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mycompany.tutoriales.GestionarTutorial"%>
<%@include file="templates/header.jsp"%>
<section class="container my-2 bg-dark w-50 text-light p-2">
    <div class="container-fluid bg-dark text-light py-3">
        <header class="text-center">
            <h1 class="display-6">Agregar tutorial</h1>
        </header>
    </div>
    <form class="row g-3 p-3" action="SvTutorial" method="POST">
        <div class="col-md-4">
            <label for="titulo" class="form-label">Título:</label>
            <input type="text" class="form-control" id="titulo" name="titulo" required>
        </div>
        <div class="col-md-4">
            <label for="prioridad" class="form-label">Prioridad (1 - 10):</label>
            <input type="number" class="form-control" id="prioridad" name="prioridad" min="1" max="10" required>
        </div>

        <div class="col-md-4">
            <label for="inputState" class="form-label">Categoría:</label>
            <select name="categoria" class="form-select" id="categoria">
                <option value="" disabled selected>-- Selecciona una categoría --</option>
                <%
                    try {
                        Connection conn = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;

                        GestionarTutorial gestionar = new GestionarTutorial();
                        conn = gestionar.establecerConexion();

                        String sql = "SELECT * FROM gestortutorial.categoria;";
                        stmt = conn.prepareStatement(sql);
                        rs = stmt.executeQuery();

                        while (rs.next()) {
                            int idCategoria = rs.getInt("idCategoria");
                            String categoria = rs.getString("categoria");
                %>
                <option value="<%= idCategoria%>"><%= categoria%></option>
                <%
                        }
                        conn.close(); // Cerrar la conexión cuando hayas terminado de usarla
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                %>
            </select>
        </div>

        <div class="col-md-8">
            <label for="url" class="form-label">URL de YouTube:</label>
            <input type="text" class="form-control" id="url" name="url" required>
        </div>

        <div class="col-md-12">
            <button type="submit" class="btn btn-primary">Enviar</button>
        </div>
    </form>
</section>
<div class="container mt-5">
    <h2>Tutoriales</h2>
    <nav class="navbar navbar-expand-lg navbar-light bg-light mb-3">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">Ordenar</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Ordenar por
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="SvEditar?orden=tituloAsc">Título (Ascendente)</a></li>
                            <li><a class="dropdown-item" href="SvEditar?orden=tituloDesc">Título (Descendente)</a></li>
                            <li><a class="dropdown-item" href="SvEditar?orden=prioridad">Prioridad</a></li>
                            <li><a class="dropdown-item" href="SvEditar?orden=categoria">Categoría</a></li>
                            <li><a class="dropdown-item" href="SvEditar?orden=estado">Estado</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Título</th>
                    <th>Prioridad(1-10)</th>
                    <th>Categoría</th>
                    <th>Estado</th>
                    <th>URL</th>
                    <th>Cambiar Estado</th>
                    <th>Editar</th>
                    <th>Eliminar</th>
                </tr>
            </thead>
            <tbody>
                <!-- Aquí se incluirán los datos de los tutoriales -->
                <%= GestionarTutorial.ObtenerTutoriales()%>
            </tbody>
        </table>
    </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Editar Tutorial</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editTutorialForm" action="SvEditar" method="POST">
                    <div class="mb-3">
                        <label for="editTitulo" class="form-label">Título</label>
                        <input type="text" class="form-control" id="editTitulo" name="editTitulo">
                    </div>
                    <div class="mb-3">
                        <label for="editPrioridad" class="form-label">Prioridad</label>
                        <input type="number" class="form-control" id="editPrioridad" name="editPrioridad">
                    </div>
                    <div class="mb-3">
                        <label for="editUrl" class="form-label">URL</label>
                        <input type="text" class="form-control" id="editUrl" name="editUrl">
                    </div>
                    <div class="mb-3">
                        <label for="editCategoria" class="form-label">Categoría</label>
                        <select class="form-select" id="categoria" name="categoria" required>
                            <!-- Opciones de categoría -->
                            <option value="" disabled selected>-- Selecciona una categoría --</option>
                            <%
                                Connection conn = null;
                                PreparedStatement stmt = null;
                                ResultSet rs = null;
                                try {
                                    GestionarTutorial gestionar = new GestionarTutorial();
                                    conn = gestionar.establecerConexion();
                                    String sql = "SELECT * FROM gestortutorial.categoria;";
                                    stmt = conn.prepareStatement(sql);
                                    rs = stmt.executeQuery();
                                    while (rs.next()) {
                                        int idCategoria = rs.getInt("idCategoria");
                                        String categoria = rs.getString("categoria");
                            %>
                            <option value="<%= idCategoria%>"><%= categoria%></option>
                            <%
                                    }
                                    conn.close(); // Cerrar la conexión cuando hayas terminado de usarla
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            %>
                        </select>
                    </div>
                    <input type="hidden" id="editIdTutorial" name="editIdTutorial">
                    <div class="col-md-12">
                        <button type="submit" class="btn btn-primary">Enviar</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="confirmacionModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Confirmación</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ¿Deseas cambiar el estado del tutorial?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" id="confirmarCambioBtn">Confirmar</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmDeleteModalLabel">Confirmación de Eliminación</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ¿Está seguro de que desea borrar este tutorial?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Eliminar</button>
            </div>
        </div>
    </div>
</div>
<%@include file="templates/footer.jsp"%>
