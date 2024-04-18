<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function confirmarEliminacion(idTutorial) {
        var confirmacion = confirm("¿Está seguro de que desea borrar este tutorial?");
        if (confirmacion) {
            window.location.href = "SvTutorial?idTutorial=" + idTutorial;
        } else {
            alert("Eliminación cancelada.");
        }
    }
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
</script>
</body>
</html>
