<%-- 
    Document   : index
    Created on : Oct 12, 2013, 6:43:06 AM
    Author     : ruben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="http://leaflet.cloudmade.com/dist/leaflet.js" type="text/javascript"></script>
        <link rel="stylesheet" href="http://leaflet.cloudmade.com/dist/leaflet.css" />
    </head>
    <body>
        <div id='map' style='height:400px;width:500px;'></div>
        <div id='actions'><a href='#'>Find me!</a></div>
    </body>
    <script>

        function initMap() {
            var options = {center: new L.LatLng(51.930156, 7.189230), zoom: 7};

            var osmUrl = 'http://a.tiles.mapbox.com/v3/ruben.map-tlseskm0/{z}/{x}/{y}.png',
                    osmAttribution = 'Map data &copy; 2012 OpenStreetMap contributors',
                    osm = new L.TileLayer(osmUrl, {maxZoom: 18, attribution: osmAttribution});

            var mapLayer = new L.TileLayer(osmUrl);

            this.map = new L.Map('map', options).addLayer(mapLayer);
        }

        function locateUser() {
            this.map.locate({setView: true});
        }

        var map = null;

        initMap();

        $('#actions').on('click', function() {
            locateUser();
        });






    </script>
</html>