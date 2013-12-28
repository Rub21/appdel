<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estadisticas de Incidencias</title>
    </head>
    <jsp:include page="plantillas/styles.jspf"></jsp:include>
    </head>
    <body>
    <jsp:include page="plantillas/header.jspf"></jsp:include>


    <!---Estadisticas-->
    <div class="container" style="margin-top: 150px">
        <div class="row-fluid">
            <div class="span6 well">
                <div id="est_mes"></div>
            </div>
            <div class="span6 well">
                <div id="est_crimen"></div>
            </div>
        </div>

        <div class="row-fluid">
            <div class="span5"><h4 style="color: #ffffff">Visualizar estadisticas por tipo de Incidente :</h4></div>
            <div class="span7">
                <select name='tipo' id='tipo' align="left">                    
                    <option value='robo'>Robo</option>
                    <option value='agresion'>Agresión</option>                                                    
                    <option value='accidente'>Accidente</option>
                    <option value='violencia_familiar'>Violencia Familiar</option>
                    <option value='otros'>Otros Incidentes</option>
                </select>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span3">

            </div>
            <div class="span6 well">
                <div id="tipo_incidente">

                </div>
            </div>
            <div class="span3">

            </div>

        </div>
    </div><!--/row-->



    <div class="footer">

    </div>


    <script src="lib/jquery-1.8.2.js"></script>
    <script src="lib/bootstrap.min.js"></script>
    <script src="lib/underscore-min.js"></script>
    <script src="http://localhost:8080/appdel/SCifras_total_crimen"></script>
    <script src="http://localhost:8080/appdel/SCifras_total_mes"></script>
    <script src="http://localhost:8080/appdel/SCifras_robo"></script>
    <script src="http://localhost:8080/appdel/SCifras_agresion"></script>
    <script src="http://localhost:8080/appdel/SCifras_accidente"></script>
    <script src="http://localhost:8080/appdel/SCifras_violencia_familiar"></script>
    <script src="http://localhost:8080/appdel/SCifras_otros_incidentes"></script>

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script src="js/estadisticas.js"></script>

</body>
</html>
