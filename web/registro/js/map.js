
//Resize map
var n_map = $(window).height();
$('#map').css('height', n_map - 60);

var map = L.mapbox.map('map', 'ruben.map-5m93f3zc').setView([-14.041, -74.636], 8);

/*var fullscreenControl = new L.Control.Fullscreen();
 fullscreenControl.addTo(map);*/
L.control.scale().addTo(map);

var minimap = new L.Control.MiniMap(L.mapbox.tileLayer('ruben.map-5m93f3zc'));
minimap.addTo(map);

//para obtener el hash
window.setTimeout(function() {
    var hash = L.hash();
    hash.init(map);
}, 3000);


/***********GEOLOCATED**********/
var geolocate = document.getElementById('geolocate');

if (!navigator.geolocation) {
    geolocate.innerHTML = 'geolocation is not available';
} else {
    geolocate.onclick = function(e) {
        e.preventDefault();
        e.stopPropagation();
        map.locate();
    };
}
map.on('locationfound', function(e) {
    map.fitBounds(e.bounds);
    var geojson = {
        type: "Feature",
        geometry: {
            type: "Point",
            coordinates: [e.latlng.lng, e.latlng.lat]
        },
        properties: {
            "title": "Aqui Estoy",
            'marker-color': '#3B5998',
            "marker-symbol": "pitch",
            "marker-size": "large",
        }
    };
    var markerLayer = L.mapbox.markerLayer(geojson).addTo(map);
    map.zoom(15);
    // var markerLayer = L.mapbox.markerLayer(geojson)   // hide all markers
    // .setFilter(function() { return false; })
    // .addTo(map);      
//    geolocate.parentNode.removeChild(geolocate);
});

map.on('locationerror', function() {
    geolocate.innerHTML = 'position could not be found';
});


L.control.layers({
    'Mapa Base': L.mapbox.tileLayer('ruben.map-5m93f3zc').addTo(map),
    'Mapa Morfologico': L.mapbox.tileLayer('ruben.map-tlseskm0')
}).addTo(map);
