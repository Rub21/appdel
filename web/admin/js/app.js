// initialize the map on the "map" div
var map = new L.Map('map');

var cloudmade = new L.TileLayer('http://a.tiles.mapbox.com/v3/ruben.mapa_seguridadciudadana/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a>', minZoom: 14, maxZoom: 19
});
// add the CloudMade layer to the map set the view to a given center and zoom
map.addLayer(cloudmade).setView(new L.LatLng(-13.1548, -74.2044), 15);
map.on('click', onMapClick);
var popup = new L.Popup();

function onMapClick(e) {
    // var latlngStr = "<div id=\'contenconr\'>(<div id=\'lat\'>" + e.latlng.lat.toFixed(5) + '</div>,<div id=\'lon\'>' + e.latlng.lng.toFixed(5) + '</div>)</div>';
    $('#latitud').val(e.latlng.lat.toFixed(5));
    $('#longitud').val(e.latlng.lng.toFixed(5))
    popup.setLatLng(e.latlng);
    popup.setContent("<a id=\'formid\' href=\'#\' onclick=\'passdata()\'>Registrar Incidente</a>");
    map.openPopup(popup);
}

function passdata()
{    $('.click').trigger('click');
    $('#popover').css({
        'width': 'auto',
        'height': '100%',
        'margin-top': '-5%',
        'margin-left': function() {
            return -($(this).width() / 2);
        }
    });
    $('#fecha').val('');
    $('#hora').val('');
    $('#descripcion').val('');
    $('#direcion').val('');
}


//encuentrame
// add location control to global name space for testing only
// on a production site, omit the "lc = "!
lc = L.control.locate({
        follow: true,
        stopFollowingOnDrag: true
}).addTo(map);