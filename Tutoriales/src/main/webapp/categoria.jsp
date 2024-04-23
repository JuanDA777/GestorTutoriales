<%@page import="com.mycompany.tutoriales.GestionarCategoria"%>
<%@include file="templates/header.jsp"%>

<section class="container my-2 bg-dark w-50 text-light p-2">
    <div class="container-fluid bg-dark text-light py-3">
        <header class="text-center">
            <h1 class="display-6">Agregar Categor�a</h1>
        </header>
    </div>
    
    <form class="row g-3 p-3" action="SvCategoria" method="POST">
        <div class="col-md-8">
            <label for="categoria" class="form-label">Nueva Categor�a:</label>
            <input type="text" class="form-control" id="categoria" name="categoria" required>
        </div>
        <div class="col-md-12">
            <button type="submit" class="btn btn-light">Agregar Categor�a</button>
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
                    <th>Categor�a</th>
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
<div class="modal fade" id="confirmarEliminarModal" tabindex="-1" aria-labelledby="confirmarEliminarModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmarEliminarModalLabel">Confirmar Eliminaci�n</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>�Est� seguro de que desea eliminar esta categor�a? </p>
                <p>Si esta categoria tiene tutoriales viculados tambien seran eliminados</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-danger" id="confirmarEliminarBtn">Eliminar</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="editarCategoria" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Editar categoria</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="col-md-8">
                    <form action="SvEditarCategoria" method="post">
                        <!-- Campo oculto para almacenar el ID de la categor�a -->
                        <input type="hidden" id="idCategoria" name="idCategoria" value="">
                        <div class="mb-3">
                            <label for="categoria" class="form-label">Categor�a</label>
                            <input type="text" class="form-control" id="categoria" name="categoria" placeholder="Ingresa la categor�a">
                        </div>
                        <button type="submit" class="btn btn-primary">Enviar</button>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>


<%@include file="templates/footer.jsp"%>

