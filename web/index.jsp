<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Incidentes Ayacucho</title>

        <link href='http://api.tiles.mapbox.com/mapbox.js/v1.4.2/mapbox.css' rel='stylesheet' />
        <script src='http://api.tiles.mapbox.com/mapbox.js/v1.4.2/mapbox.js'></script>
        <link rel="stylesheet" href="lib/jquery-ui.css" />
        <link rel="stylesheet" href="lib/jquery.ptTimeSelect.css" />

  
        <link rel="stylesheet" href="css/MarkerCluster.css" />
        <link rel="stylesheet" href="css/MarkerCluster.Default.css" />     
        <script src="css/leaflet.markercluster.js"></script>
        
        <jsp:include page="plantillas/styles.jspf"></jsp:include>
            <link href='css/style-index.css' rel='stylesheet' />            

            <script src="http://localhost:8080/appdel/SObtener_crimenes"></script>

        </head>

        <body>
        <jsp:include page="plantillas/header.jspf"></jsp:include>

        <div id="map"></div>

        <div id="busqueda">
            <div class="content well">
                <h4>Busqueda de incidentes</h4>

                <div class="row-fluid">                    
                    <div class="span2">Del:</div>
                    <div class="span10"> 
                        <input type="text" name="fecha" value=""  id="fecha_inicio" style="width: 150px"  readonly>
                    </div>
                </div>
                <div class="row-fluid">                    
                    <div class="span2">Al:</div>
                    <div class="span10"> 
                        <input type="text" name="fecha" value=""  id="fecha_fin" style="width: 150px" readonly>
                    </div>
                </div>
                <div class="row">                    
                    <div class="span12"> <button type="submit" class="btn btn-primary" id="button_filtrar">  Filtrar</button></div>

                </div>
            </div>
            <div class="content well">
                <h4>Tipos de incidentes</h4>
                <ul id='tipo_incidentes'>
                    <li> <a href='#' id='Robo'>Robo</a></li>
                    <li><a href='#' id='Agresión'>Agresión</a>    </li>                                                
                    <li> <a href='#' id='Accidente'>Accidente</a>
                    <li> <a href='#' id='Violencia Familiar'>Violencia Familiar</a></li>
                    <li> <a href='#' id='Otros Incidentes'>Otros Incidentes</a></li>
                </ul>
            </div>
        </div>

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



        <script src="lib/jquery-1.8.2.js"></script>
        <script src="lib/jquery-ui.js"></script>
        <script  src="lib/jquery.ptTimeSelect.js"></script>

        <script src="lib/bootstrap.min.js"></script>
        <script src="lib/underscore-min.js"></script>
        <script src="lib/moment.min.js"></script>



        <script src="js/detalle.js"></script>
        <script src="js/app.js"></script>

    </body>
</html>
