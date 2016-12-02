/*var map = L.mapbox.map('map', ruben + id)
        .setView([-13.1624, -74.2159], 15);

var myIcon = L.icon({
    iconUrl: icono_in,
    iconSize: [20, 20]
});

var myIcon_pc = L.icon({
    iconUrl: icono_pc,
    iconSize: [35, 90],
    iconAnchor: [22, 94],
    popupAnchor: [-3, -80]
            //shadowUrl: 'my-icon-shadow.png',
            //shadowRetinaUrl: '[email blocked]',
            //shadowSize: [68, 95],
            //shadowAnchor: [22, 150]
});
*/
url_data = url_data + 'SObtener_crimenes';
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

for (var i = 0; i < puntos_criticos.length; i++) {
    var idcrimen = puntos_criticos[i].idcrimen;
    var title = puntos_criticos[i].tipo;
    idpc = puntos_criticos[i].idpc;
    tipo = puntos_criticos[i].tipo;
    direccion_ref = puntos_criticos[i].direccion_ref;
    descripcion = puntos_criticos[i].descripcion;
    var marker = L.marker(new L.LatLng(puntos_criticos[i].latitud, puntos_criticos[i].longitud), {
        icon: myIcon_pc
    });
    marker.bindPopup("<h2>" + tipo + "</h2><p>" + descripcion + "</p>");
    map.addLayer(marker);}
$(document).on('ready', function() {});

