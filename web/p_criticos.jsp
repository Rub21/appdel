<%-- 
    Document   : p_criticos
    Created on : Dec 28, 2013, 7:59:47 AM
    Author     : ruben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Puntos Criticos</title>
        <link href='http://api.tiles.mapbox.com/mapbox.js/v1.4.2/mapbox.css' rel='stylesheet' />
        <script src='http://api.tiles.mapbox.com/mapbox.js/v1.4.2/mapbox.js'></script>


        <script src='http://localhost:8080/appdel/SObtener_puntos_critico'></script>
        <jsp:include page="plantillas/styles.jspf"></jsp:include>
            <link href='css/style-index.css' rel='stylesheet' />  
            <style>
                .leaflet-left .leaflet-control{
                    margin-left: -250px;
                    margin-top: 10px;

                }
            </style>

        </head>

        <body>
        <jsp:include page="plantillas/header.jspf"></jsp:include>

        <div id="map"></div>
        <script src="js/app_p_criticos.js"></script>
    </body>
</html>
