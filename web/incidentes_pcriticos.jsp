<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Incidentes VS Puntos Criticos</title>

        <link href='http://api.tiles.mapbox.com/mapbox.js/v1.4.2/mapbox.css' rel='stylesheet' />       

        <link rel="stylesheet" href="css/MarkerCluster.css" />
        <link rel="stylesheet" href="css/MarkerCluster.Default.css" />   


        <jsp:include page="plantillas/styles.jspf"></jsp:include>
            <link href='css/style-index.css' rel='stylesheet' />            

            <script src="http://localhost:8080/appdel/SObtener_crimenes"></script>
            <script src='http://localhost:8080/appdel/SObtener_puntos_critico'></script>

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



        <!--Ventana de Detalle de delito
               
        -->
        <div id="modal">
            <div id="popover" class="modal container hide fade" tabindex="-1">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

                    <h1>
                        <spam class="tipo"></spam>
                    </h1>

                    <strong>Fecha:</strong> <spam class="fecha"></spam>, <spam class="hora"></spam> <br>

                    <strong>Registrado por:</strong><spam class="usuario"></spam> 
                </div>
                <div class="modal-body">
                    <div class="row-fluid">

                        <div class="span12">
                            <p class="descripcion"></p>
                        </div>

                    </div>

                    <div class="row-fluid">

                        <div class="span12">
                            <strong>Direción de Referencia: </strong> <spam class="direccion_ref"></spam>
                        </div>      

                    </div>

                    <div class="row-fluid">
                        <div class="span3">

                        </div>
                        <div class="span6">

                            <img class="imagen"/>
                        </div>
                        <div class="span3">

                        </div>


                    </div>

                </div>


                <div class="modal-footer">
                    <button type="button" data-dismiss="modal" class="btn btn-primary">Cerrar</button>

                </div>
            </div>
            <a href="#popover"  class="click"  data-toggle="modal"></a>

            <!--Fin detalle de delito-->



        </div>


        <div class="footer">

        </div>
        
        <script src='http://api.tiles.mapbox.com/mapbox.js/v1.4.2/mapbox.js'></script>
        <script src="css/leaflet.markercluster.js"></script>
        <script src="lib/jquery-1.8.2.js"></script>
        <script src="lib/bootstrap.min.js"></script>
        <script src="lib/underscore-min.js"></script>
        <script src="js/mapa.js"></script>
        <script src="js/detalle.js"></script>
        <script src="js/app_incidentes_pcriticos.js"></script>

    </body>
</html>
