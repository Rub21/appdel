var map = L.mapbox.map('map', 'ruben.mapa_seguridadciudadana')
        .setView([-13.1624, -74.2159], 15);

var markers = new L.MarkerClusterGroup();


for (var i = 0; i < crimenes.length; i++) {

    console.log(crimenes[i]);

    var idcrimen = crimenes[i].idcrimen;
    var title = crimenes[i].tipo;
    var imagen = "crimen_imagenes/" + crimenes[i].imagen;
    var descripcion = crimenes[i].descripcion;

    var marker_simbol = 'post';
    var marker = L.marker(new L.LatLng(crimenes[i].latitud, crimenes[i].longitud), {
        icon: L.mapbox.marker.icon({'marker-symbol': marker_simbol, 'marker-color': '456789'}),
        title: title,
        imagen: imagen

    });
    //marker.bindPopup(title);
    marker.bindPopup("<h2>" + title + "</h2><p>" + descripcion + "</p>" + '<a href="#detail" onclick="fun_detalle(\'' + idcrimen + '\')"> Más Detalle</a>');
    markers.addLayer(marker);
}

map.addLayer(markers);

$(document).on('ready', function() {

//filtrar
    $('#button_filtrar').click(function() {
        console.log(map)
        console.log(markers);

        markers.setFilter(function(f) {
            return false;
        });

        /*   _map.markerLayer.setFilter(function(f) {
         console.log(f)
         return false;
         
         });*/
    });



});

