
var markerVehiculo, mapa;

$().ready(function() {
    $('#tabla').hide();
    window.setInterval("actualizarPosicionVehiculo()", 5000);
    $("#botonVerMas").on('click', function(e) {
        $('#tabla').show();
        verMas();
        
    });
});

function verMas() {
    $.post('../servletHistorialVehiculo', {
        metodo: 'verMas',
        placa: $('#placa').val()
    }, function(data) {
        $('#resultado').html(data);
    });
}

function mostrarMapa(x, y) {
    var mapDiv = document.getElementById('mapa');
    var options = {
        center: new google.maps.LatLng(x, y),
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    mapa = new google.maps.Map(mapDiv, options);
    markerVehiculo = new google.maps.Marker({
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

function actualizarPosicionVehiculo() {
    if (markerVehiculo != null) {
        markerVehiculo.setMap(null);
    }
    $.post('../servletHistorialVehiculo', {
        metodo: 'actualizarPosicionVehiculo',
        placa: $('#placa').val()
    }, function(data) {
        dibujarVehiculo(data);
    }, "json");
}

function dibujarVehiculo(data) {
    markerVehiculo = new google.maps.Marker({
        position: new google.maps.LatLng(data["lat"], data["lng"])
                , map: mapa
                , icon: '../imagenes/icono_carro.png'
    });
}