<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    <!-- Este script manejar� la apertura de la modal y la configuraci�n de los valores de los campos -->

    // Funci�n para manejar el evento cuando se abre la modal
    $('#editModal').on('show.bs.modal', function (event) {
        // Obtener el bot�n que activ� la modal
        var button = $(event.relatedTarget);
        // Extraer los datos del bot�n
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
        // Obt�n el ID del tutorial desde el atributo data-id del bot�n
        var idTutorial = $(this).data('id');
        // Muestra la modal de confirmaci�n
        $('#confirmacionModal').modal('show');
        // Almacena el ID del tutorial en un atributo de datos en la modal para usarlo despu�s
        $('#confirmacionModal').data('idTutorial', idTutorial);
    });
    // Manejador de eventos para el bot�n de confirmaci�n dentro de la modal
    $('#confirmarCambioBtn').click(function() {
        // Obt�n el ID del tutorial almacenado en la modal
        var idTutorial = $('#confirmacionModal').data('idTutorial');
        // Realiza una solicitud AJAX al servlet SvCambiarEstado
        $.post('SvCambiarEstado', { idTutorial: idTutorial }, function() {
        // Recarga la p�gina para reflejar el cambio
        location.reload();
        });
        // Oculta la modal de confirmaci�n
        $('#confirmacionModal').modal('hide');
    });
    
    // Asignar evento clic al bot�n de eliminar
    $('#confirmDeleteBtn').click(function() {
        // Obtener el ID del tutorial
        var idTutorial = $(this).data('id');
        // Redirigir a la URL de eliminaci�n
        window.location.href = "SvTutorial?idTutorial=" + idTutorial;
    });
    
    // Funci�n para mostrar la modal de confirmaci�n
    function confirmarEliminacion(idTutorial) {
        $('#confirmDeleteModal').modal('show'); // Mostrar la modal
        $('#confirmDeleteBtn').data('id', idTutorial); // Almacenar el ID del tutorial en el bot�n de eliminaci�n
    }
    
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

    
</body>
</html>
