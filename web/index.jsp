<%-- 
    Document   : index
    Created on : Oct 12, 2013, 6:43:06 AM
    Author     : ruben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Template &middot; Bootstrap</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <link href="lib/bootstrap.css" rel="stylesheet">
        <link href="lib/bootstrap-responsive.css" rel="stylesheet">

        <link href="css/styles.css" rel="stylesheet">



        <script src='http://api.tiles.mapbox.com/mapbox.js/v1.4.2/mapbox.js'></script>
        <link href='http://api.tiles.mapbox.com/mapbox.js/v1.4.2/mapbox.css' rel='stylesheet' />

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="../assets/js/html5shiv.js"></script>
        <![endif]-->

        <link rel="stylesheet" href="css/MarkerCluster.css" />
        <link rel="stylesheet" href="css/MarkerCluster.Default.css" />
        <!--[if lte IE 8]>
          <link rel="stylesheet" href="css/MarkerCluster.Default.ie.css" />
        <![endif]-->
        <script src="css/leaflet.markercluster.js"></script>

        <link href='css/style-map.css' rel='stylesheet' />

        <script src="http://localhost:8080/appdel/SOptener_crimenes"></script>

    </head>

    <body>
        <div id="cabecera">
            <div class="masthead">
                <h3 class="muted">Ayacucho Seguro</h3>
                <div class="navbar navbar-inverse">
                    <div class="navbar-inner">
                        <div class="container">
                            <ul class="nav">
                                <li class="active"><a href="#">Inicio</a></li>
                                <li><a href="#">Robos </a></li>
                                <li><a href="#">Asaltos</a></li>
                                <li><a href="#">Downloads</a></li>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                </div><!-- /.navbar -->
            </div>
        </div>

        <div id="map"></div>

        <div id="busqueda">
            <div class="content well">
                <h4>Busqueda de incidentes</h4>

                <div class="row-fluid">                    
                    <div class="span2">Del:</div>
                    <div class="span10"> 
                        <input type="text" name="fecha" value=""  id="fecha_inicio" style="width: 150px"  >
                    </div>
                </div>
                <div class="row-fluid">                    
                    <div class="span2">Al:</div>
                    <div class="span10"> 
                        <input type="text" name="fecha" value=""  id="fecha_fin" style="width: 150px">
                    </div>
                </div>
                <div class="row">                    
                    <div class="span12"> <button type="submit" class="btn btn-primary" id="button_filtrar">  Filtrar</button></div>

                </div>
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

        <!--Seccion de estadisticas-->


        <div id="estadisticas">




        </div>
        <!-- fin de secino de estadisticas-->


        <script src="lib/jquery-1.8.2.js"></script>
        <script src="lib/bootstrap.min.js"></script>
        <script src="lib/underscore-min.js"></script>

        <script src="js/detalle.js"></script>

        <script src="js/app.js"></script>

    </body>
</html>
