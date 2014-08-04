var res='';
var lng, lat;

$().ready(function() {
    lng=-79523581;
    lat=8974960;
window.setInterval("funcion()", 2000);
});

function funcion() {
    $.post('servletHistorialVehiculo', {
        metodo: 'simular',
        lng:lng,
        lat:lat
    }, function(data) {
        res=res+data+'<br>';
        $('#res').html(res);
    });
    lng=lng+500;
    lat=lat-5;
}