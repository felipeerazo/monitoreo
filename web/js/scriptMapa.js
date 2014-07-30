function verInfo(x, y, marcador, placa) {
    mostrarMapa(x, y, marcador);
    document.getElementById('fuenteplaca').innerHTML = placa;
}

function mostrarMapa(x, y, marcador) {
    var mapDiv = document.getElementById('mapa');
    var options = {
        center: new google.maps.LatLng(x, y),
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    mapa = new google.maps.Map(mapDiv, options);

    if (marcador) {
        var marker = new google.maps.Marker({
            position: mapa.getCenter()
                    , map: mapa
                    , title: 'vehiculo'
                    , icon: 'imagenes/icono_carro.png'
                    /*, cursor: 'default'
                     , clickable: false*/
        });
        /*var contenido='<div class="infoWindow">'+
         'Lateral del taxi:<br>'+
         'Tiempo de llegada:<br>'+
         'Nombre del taxista:'+
         '</div>';
         var popup = new google.maps.InfoWindow({
         content: contenido
         }); 
         popup.open(mapa, marker);*/
    }
}
;



function mostrarMapa(x, y, marcador) {
    var mapDiv = document.getElementById('mapa');
    var options = {
        center: new google.maps.LatLng(x, y),
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var mapa = new google.maps.Map(mapDiv, options);

    if (marcador) {
        var marker = new google.maps.Marker({
            position: mapa.getCenter()
                    , map: mapa
                    , title: 'vehiculo'
                    , icon: 'imagenes/icono_carro.png'
                    /*, cursor: 'default'
                     , clickable: false*/
        });
        /*var contenido='<div class="infoWindow">'+
         'Lateral del taxi:<br>'+
         'Tiempo de llegada:<br>'+
         'Nombre del taxista:'+
         '</div>';
         var popup = new google.maps.InfoWindow({
         content: contenido
         }); 
         popup.open(mapa, marker);*/
    }
}
;


var mapa;

function mostrarMapaPanico() {
    var mapDiv = document.getElementById('mapa_panico');
    var options = {
        center: new google.maps.LatLng(5.0622453, -75.5071972),
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    mapa = new google.maps.Map(mapDiv, options);
}
;

function buscarPanico(lat, lng){
    
   mapa.setCenter(new google.maps.LatLng(lat,lng));
}

function ubicarVehiculos(lat, lng, placa, imagen){
    var marker = new google.maps.Marker({
            position: new google.maps.LatLng(lat, lng)
                    , map: mapa
                    , icon: imagen
                    /*, cursor: 'default'
                     , clickable: false*/
        });
        
        var popup = new google.maps.InfoWindow({
            content: placa
        }); 
        popup.open(mapa, marker);
}