var map = L.mapbox.map('map', 'ruben.mapa_seguridadciudadana')
        .setView([-13.1624, -74.2159], 15);

var myIcon = L.icon({
    iconUrl: 'https://dl.dropboxusercontent.com/u/43116811/ruben/accidentex20.png',
    iconSize: [20, 20]
});
var url_data = 'http://localhost:8080/appdel/SObtener_crimenes';
var crimenes = {
    "type": "FeatureCollection",
    "features": []
};
$.getJSON(url_data, {
    format: "json"
}).done(function(data) {
    $.each(data, function(i, item) {
        map.markerLayer.on('layeradd', function(e) {
            var marker = e.layer;
            var feature = marker.feature;
            marker.setIcon(myIcon);
            var popupContent = "<h2>" + feature.properties.tipo + "</h2><p>" + feature.properties.descripcion + "</p>" + '<a href="#detail" onclick="fun_detalle(\'' + feature.properties.idcrimen + '\')"> Más Detalle</a>';
            marker.bindPopup(popupContent, {
                closeButton: false,
                minWidth: 200
            });
        });
        var d = {
            "geometry": {
                "type": "Point",
                "coordinates": [item.longitud, item.latitud]
            },
            "type": "Feature",
            "properties": {
                descripcion: item.descripcion,
                direccion_ref: item.direccion_ref,
                estado: item.estado,
                fecha: item.fecha,
                hora: item.hora,
                idcrimen: item.idcrimen,
                idusuario: item.idusuario,
                imagen: item.imagen,
                latitud: item.latitud,
                longitud: item.longitud,
                tipo: item.tipo,
                usuario: item.usuario

            }
        };
        crimenes.features.push(d);
    });

    map.markerLayer.setGeoJSON(crimenes);

});



var geoJson = {
    type: 'FeatureCollection',
    features: []
};




console.log(puntos_criticos)
for (i = 0; i < puntos_criticos.length; i++) {
    var data = {};

    data.type = 'Feature';
    data.properties = {};
    data.properties.idpc = puntos_criticos[i].idpc;
    data.properties.tipo = puntos_criticos[i].tipo;
    data.properties.direccion_ref = puntos_criticos[i].direccion_ref;
    data.properties.descripcion = puntos_criticos[i].descripcion;
    data.properties['marker-symbol'] = "danger";
    data.properties['marker-color'] = '#E5AC03';
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

    var popupContent = '<h3>' + feature.properties.tipo.toUpperCase() + '</h3>' +
            '   <p>' + feature.properties.direccion_ref + '</p>';

    marker.bindPopup(popupContent, {
        closeButton: false,
        minWidth: 250
    });
});

// Add features to the map
map.markerLayer.setGeoJSON(geoJson);




$(document).on('ready', function() {


});

