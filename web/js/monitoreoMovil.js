
$().ready(function() {
    $('#tabla').hide();
    $("#botonVerMas").on('click', function(e) {
        $('#tabla').show();
        $.post('../servletHistorialVehiculo', {
            placa:$('#placa').val()
        }, function(responseText) {
            $('#resultado').html(responseText);
        });
    });
});

function mostrarMapa(x, y) {
    var mapDiv = document.getElementById('mapa');
    var options = {
        center: new google.maps.LatLng(x, y),
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var mapa = new google.maps.Map(mapDiv, options);
    var marker = new google.maps.Marker({
        position: mapa.getCenter()
                , map: mapa
                , icon: '../imagenes/icono_carro.png'
                /*, cursor: 'default'
                 , clickable: false*/
    });
}
;

function obtenerCiudad(id, lat, lng) {
    $.getJSON(
            //URL del servidor de google para traducir junto con las coordenadas
            "http://maps.googleapis.com/maps/api/geocode/json?latlng=" + lat + "," + lng + "&sensor=true",
            function(data) {
                $(id).attr('value', data.results[1].formatted_address);
            });
}

