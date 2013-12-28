var map = L.mapbox.map('map', 'ruben.mapa_seguridadciudadana')
        .setView([-13.1624, -74.2159], 15);


var geoJson = {
    type: 'FeatureCollection',
    features: []
};




for (i = 0; i < puntos_criticos.length; i++) {
    var data = {};

    data.type = 'Feature';
    data.properties = {};
    data.properties.idpc = puntos_criticos[i].idpc;
    data.properties.tipo = puntos_criticos[i].tipo;
    data.properties.direccion_ref = puntos_criticos[i].direccion_ref;
    data.properties.descripcion = puntos_criticos[i].descripcion;
    /* data.properties['marker-symbol'] = "police";
     data.properties['marker-color'] = '#46629E';*/
    data.properties['marker-symbol'] = "danger";
    data.properties['marker-color'] = '#CC181E';
    data.properties['marker-size'] = 'large';

    data.geometry = {};
    data.geometry.type = 'Point';
    data.geometry.coordinates = [puntos_criticos[i].longitud, puntos_criticos[i].latitud];

    console.log(data)
    geoJson.features.push(data)
}

map.markerLayer.on('layeradd', function(e) {
    var marker = e.layer,
            feature = marker.feature;

    // Create custom popup content
    var popupContent = '<h3>' + feature.properties.tipo.toUpperCase() + '</h3>' +
            '   <p>' + feature.properties.direccion_ref + '</p>';

    // http://leafletjs.com/reference.html#popup
    marker.bindPopup(popupContent, {
        closeButton: false,
        minWidth: 250
    });
});

// Add features to the map
map.markerLayer.setGeoJSON(geoJson);








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

