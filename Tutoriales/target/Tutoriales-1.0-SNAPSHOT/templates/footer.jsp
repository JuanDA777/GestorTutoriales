<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    <!-- Este script manejará la apertura de la modal y la configuración de los valores de los campos -->

    // Función para manejar el evento cuando se abre la modal
    $('#editModal').on('show.bs.modal', function (event) {
        // Obtener el botón que activó la modal
        var button = $(event.relatedTarget);
        // Extraer los datos del botón
        var idTutorial = button.data('id');
        var titulo = button.data('titulo');
        var prioridad = button.data('prioridad');
        var url = button.data('url');
        var categoria = button.data('categoria');
        var button = $(event.relatedTarget);
        // Configurar los valores de los campos del formulario con los datos obtenidos
        var modal = $(this);
        modal.find('.modal-body #editIdTutorial').val(idTutorial);
        modal.find('.modal-body #editTitulo').val(titulo);
        modal.find('.modal-body #editPrioridad').val(prioridad);
        modal.find('.modal-body #editUrl').val(url);
        modal.find('.modal-body #editCategoria').val(categoria);
        console.log("Valor de data-categoria:", button.data('categoria'));
    });

    // Asigna un evento clic a todos los botones con la clase "cambiar-estado-btn"
    $('.cambiar-estado-btn').click(function() {
        // Obtén el ID del tutorial desde el atributo data-id del botón
        var idTutorial = $(this).data('id');
        // Muestra la modal de confirmación
        $('#confirmacionModal').modal('show');
        // Almacena el ID del tutorial en un atributo de datos en la modal para usarlo después
        $('#confirmacionModal').data('idTutorial', idTutorial);
    });
    // Manejador de eventos para el botón de confirmación dentro de la modal
    $('#confirmarCambioBtn').click(function() {
        // Obtén el ID del tutorial almacenado en la modal
        var idTutorial = $('#confirmacionModal').data('idTutorial');
        // Realiza una solicitud AJAX al servlet SvCambiarEstado
        $.post('SvCambiarEstado', { idTutorial: idTutorial }, function() {
        // Recarga la página para reflejar el cambio
        location.reload();
        });
        // Oculta la modal de confirmación
        $('#confirmacionModal').modal('hide');
    });
    
    // Asignar evento clic al botón de eliminar
    $('#confirmDeleteBtn').click(function() {
        // Obtener el ID del tutorial
        var idTutorial = $(this).data('id');
        // Redirigir a la URL de eliminación
        window.location.href = "SvTutorial?idTutorial=" + idTutorial;
    });
    
    // Función para mostrar la modal de confirmación
    function confirmarEliminacion(idTutorial) {
        $('#confirmDeleteModal').modal('show'); // Mostrar la modal
        $('#confirmDeleteBtn').data('id', idTutorial); // Almacenar el ID del tutorial en el botón de eliminación
    }
    
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

    
</body>
</html>
