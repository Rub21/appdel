var ruben = 'ruben.mapa_';
var id = 'seguridadciudadana';
var url_data = 'http://localhost:8080/appdel/';
var icono_pc = 'http://a.tiles.mapbox.com/v3/marker/pin-l-danger+FFFF00.png';
var icono_in = 'https://dl.dropboxusercontent.com/u/43116811/ruben/accidentex20.png';
var icono_pv = 'http://a.tiles.mapbox.com/v3/marker/pin-l-police+44619D.png';

var map = L.mapbox.map('map', ruben + id)
        .setView([-13.1624, -74.2159], 15);

var myIcon = L.icon({
    iconUrl: icono_in,
    iconSize: [20, 20]
});
var myIcon_pv = L.icon({
    iconUrl: icono_pv,
    iconSize: [35, 90],
    iconAnchor: [22, 94],
    popupAnchor: [-3, -80]
});

var myIcon_pc = L.icon({
    iconUrl: icono_pc,
    iconSize: [35, 90],
    iconAnchor: [22, 94],
    popupAnchor: [-3, -80]
});