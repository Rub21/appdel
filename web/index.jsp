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
        <link href="lib/mapbox.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="../assets/js/html5shiv.js"></script>
        <![endif]-->

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
            
        </div>
        
       

        <script src="lib/jquery-1.8.2.js"></script>
        <script src="lib/bootstrap.min.js"></script>
        <script src="lib/mapbox.js"></script>
        <script src="js/app.js"></script>

    </body>
</html>
