var map = L.mapbox.map('map', 'ruben.mapa_seguridadciudadana')
        .setView([-13.1624, -74.2159], 15);

var markers = new L.MarkerClusterGroup();


var myIcon = L.icon({
    iconUrl: 'https://dl.dropboxusercontent.com/u/43116811/ruben/accidentex20.png',
    iconSize: [20,20]
  /*  iconAnchor: [22, 94],
    popupAnchor: [-3, -76],
    shadowUrl: 'my-icon-shadow.png',
    shadowRetinaUrl: '[email blocked]',
    shadowSize: [68, 95],
    shadowAnchor: [22, 94]*/
});

for (var i = 0; i < crimenes.length; i++) {

    //console.log(crimenes[i]);

    var idcrimen = crimenes[i].idcrimen;
    var title = crimenes[i].tipo;
    var imagen = "crimen_imagenes/" + crimenes[i].imagen;
    var descripcion = crimenes[i].descripcion;

    /*var marker_simbol = 'post';*/
    var marker = L.marker(new L.LatLng(crimenes[i].latitud, crimenes[i].longitud), {
        icon: myIcon,
        title: title,
        imagen: imagen

    });
    //marker.bindPopup(title);
    marker.bindPopup("<h2>" + title + "</h2><p>" + descripcion + "</p>" + '<a href="#detail" onclick="fun_detalle(\'' + idcrimen + '\')"> Más Detalle</a>');
    markers.addLayer(marker);
}

map.addLayer(markers);




var geoJson = {
    type: 'FeatureCollection',
    features: []
};




for (i = 0; i < puntos_vigilancia.length; i++) {
    var data = {};

    data.type = 'Feature';
    data.properties = {};
    data.properties.idpv = puntos_vigilancia[i].idpv;
    data.properties.tipo = puntos_vigilancia[i].tipo;
    data.properties.direccion_ref = puntos_vigilancia[i].direccion_ref;
    data.properties.descripcion = puntos_vigilancia[i].descripcion;  
    data.properties['marker-symbol'] = "police";
    data.properties['marker-color'] = '#44619D';
    data.properties['marker-size'] = 'large';

    data.geometry = {};
    data.geometry.type = 'Point';
    data.geometry.coordinates = [puntos_vigilancia[i].longitud, puntos_vigilancia[i].latitud];

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


});

