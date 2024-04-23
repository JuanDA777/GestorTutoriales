<%@include file="templates/header.jsp"%>

<div class="container-fluid py-5 bg-dark text-light text-center">
    <img src="https://static.vecteezy.com/system/resources/previews/003/805/406/original/online-tutorial-concept-learning-courses-tutorials-illustration-flat-vector.jpg" alt="Logo" class="img-fluid mb-4" style="max-width: 200px;">
    <h1 class="display-4 mb-3">Gestor de Tutoriales</h1>
    <p class="lead">Organiza y gestiona tus tutoriales de forma eficiente</p>
    <p>Agrega tus tutoriales favoritos, asigna niveles de prioridad y lleva un seguimiento de lo que has revisado</p>
    <a href="tutoriales.jsp" class="btn btn-light btn-lg mt-3">Agregar Tutorial</a>
</div>

<div class="container py-5">
    <div class="row">
        <div class="col-md-6">
            <h2 class="mb-4">Explora Nuestros Servicios</h2>
            <div class="card mb-4">
                <div class="card-body">
                    <h3 class="card-title">Gesti�n de Tutoriales</h3>
                    <p class="card-text">Agrega, edita y elimina tus tutoriales de manera f�cil y r�pida.</p>
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-body">
                    <h3 class="card-title">Prioridades</h3>
                    <p class="card-text">Asigna niveles de prioridad a tus tutoriales para organizar tu aprendizaje.</p>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Seguimiento</h3>
                    <p class="card-text">Mant�n un registro de los tutoriales que has revisado y los que a�n est�n pendientes.</p>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <h2 class="mb-4">Categor�as Destacadas</h2>
            <p>Las categor�as son agregadas por los usuarios para clasificar los tutoriales disponibles. A continuaci�n, algunas categor�as populares:</p>
            <div class="list-group mb-3">
                <a href="#" class="list-group-item list-group-item-action">Java</a>
                <a href="#" class="list-group-item list-group-item-action">Python</a>
                <a href="#" class="list-group-item list-group-item-action">JavaScript</a>
                <a href="#" class="list-group-item list-group-item-action">C++</a>
                <a href="#" class="list-group-item list-group-item-action">HTML/CSS</a>
            </div>
            <a href="categoria.jsp" class="btn btn-dark btn-lg mb-3">Agregar Categor�as</a>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-md-6">
            <h2 class="mb-4">Im�genes Destacadas</h2>
            <p>Aunque estas im�genes no est�n directamente relacionadas con la tem�tica de la p�gina, tienen una historia detr�s:</p>
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mb-3">
                        <div class="card">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPLJSuQ6boGMBryKkxd0kFFYcaaRJ-Qc025zXM0br38rtIC2hX_fvNgHMF5ceQYZ-4gEg&usqp=CAU" alt="Imagen 1" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title">Agujero Negro Real</h5>
                                <p class="card-text">Una imagen hist�rica capturada por el telescopio Event Horizon que muestra el primer agujero negro real.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 mb-3">
                        <div class="card">
                            <img src="https://imagenes.canalrcn.com/lomaslike/westcol-pidio-perdon-a-la-comunidad-lgbtiq.webp" alt="Imagen 2" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title">Streamer Wescol</h5>
                                <p class="card-text">Wescol, el streamer m�s popular de Colombia, pidi� disculpas a la comunidad LGBTIQ+ tras comentarios pol�micos.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 mb-3">
                        <div class="card">
                            <img src="https://imagenes.heraldo.es/files/image_990_556/uploads/imagenes/2024/04/15/israel-e-iran-dos-paises-en-pleno-conflicto.jpeg" alt="Imagen 3" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title">Conflicto Israel-Ir�n</h5>
                                <p class="card-text">Imagen de la bandera de Israel y Palestina, en medio de un tenso conflicto que podr�a desencadenar una tercera guerra mundial.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="templates/footer.jsp"%>
