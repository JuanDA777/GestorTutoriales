<%@page import="com.mycompany.tutoriales.GestionarTutorial"%>
<%@include file="templates/header.jsp"%>
<div class="container-fluid bg-dark text-light py-3">
    <header class="text-center">
        <h1 class="display-6">Formulario de tutoriales</h1>
    </header>
</div>
<section class="container my-2 bg-dark w-50 text-light p-2">
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
            <select id="inputState" class="form-select" name="categoria" required>
                <option value="" disabled selected>-- Selecciona una categoría --</option>
                <option value="1">Lógica de Programación</option>
                <option value="2">Flutter</option>
                <option value="3">Node.js</option>
                <option value="4">leguajes de programacion</option>
                <option value="5">Html</option>
                <option value="6">Bases de datos</option>
                <option value="7">Matematicas</option>
                <option value="8">Geometria</option>
                <option value="9">Fisica</option>
                <option value="10">Instalaciones</option>
                <option value="11">Juegos</option>
                <option value="12">Vida Cotidiana</option>
            </select>
        </div>
        
        <div class="col-md-4">
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
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Título</th>
                <th>Prioridad(1-10)</th>
                <th>Categoría</th>
                <th>URL</th>
                <th>Editar</th>
                <th>Eliminar</th>
            </tr>
        </thead>
        <tbody>
            <% out.println(GestionarTutorial.ObtenerTutoriales()); %>
            <!-- Suponiendo que 't' es un objeto Tutorial con los datos del tutorial -->


        </tbody>
    </table>
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
            <select class="form-select" id="editCategoria" name="editCategoria">
                <option value="" disabled selected>-- Selecciona una categoría --</option>
                <option value="1">Lógica de Programación</option>
                <option value="2">Flutter</option>
                <option value="3">Node.js</option>
                <option value="4">leguajes de programacion</option>
                <option value="5">Html</option>
                <option value="6">Bases de datos</option>
                <option value="7">Matematicas</option>
                <option value="8">Geometria</option>
                <option value="9">Fisica</option>
                <option value="10">Instalaciones</option>
                <option value="11">Juegos</option>
                <option value="12">Vida Cotidiana</option>
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

<%@include file="templates/footer.jsp"%>
