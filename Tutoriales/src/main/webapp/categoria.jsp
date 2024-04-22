<%@page import="com.mycompany.tutoriales.GestionarCategoria"%>
<%@include file="templates/header.jsp"%>
<section class="container my-2 bg-dark w-50 text-light p-2">
    <div class="container-fluid bg-dark text-light py-3">
        <header class="text-center">
            <h1 class="display-6">Agregar de categoria</h1>
        </header>
    </div>
    <form class="row g-3 p-3" action="SvCategoria" method="POST"> <!-- Cambiado a SvCategoria -->
        <div class="col-md-8">
            <label for="categoria" class="form-label">Nueva Categoría:</label>
            <input type="text" class="form-control" id="categoria" name="categoria" required>
        </div>
        <div class="col-md-12">
            <button type="submit" class="btn btn-primary">Agregar Categoría</button>
        </div>
    </form>
</section>
<div class="container mt-5">
    <h2>Tutoriales</h2>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Categoría</th>
                    <th>Editar</th>
                    <th>Eliminar</th>
                </tr>
            </thead>
            <tbody>
                <%= com.mycompany.tutoriales.GestionarCategoria.obtenerCategorias()%>
            </tbody>
        </table>
    </div>
</div>
<div class="modal fade" id="editModal   " tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
