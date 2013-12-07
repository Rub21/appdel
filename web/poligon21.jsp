<%-- 
    Document   : poligon21
    Created on : Dec 7, 2013, 9:28:00 AM
    Author     : ruben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script src="http://leafletjs.com/dist/leaflet.js"></script>


    </head>
    <body>
        <div id="map" style="height: 100%"></div>


        <script src="http://leafletjs.com/dist/leaflet.js"></script>
        <script type="text/javascript" src="https://dl.dropboxusercontent.com/u/43116811/ruben/inter.js"></script>
        <script type="text/javascript">
            var map = new L.Map('map');

            var cloudmade = new L.TileLayer('http://a.tiles.mapbox.com/v3/ruben.mapa_seguridadciudadana/{z}/{x}/{y}.png', {
                attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a>', minZoom: 14, maxZoom: 19
            });
// add the CloudMade layer to the map set the view to a given center and zoom
            map.addLayer(cloudmade).setView(new L.LatLng(-13.1548, -74.2044), 15);
        </script>

    </body>
</html>
