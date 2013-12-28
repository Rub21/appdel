<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    </div><!--/row-->

</div><!--/.fluid-container-->

<div class="footer">

</div>


<script src="lib/jquery-1.8.2.js"></script>
<script src="lib/bootstrap.min.js"></script>
<script src="lib/underscore-min.js"></script>
<script src="http://localhost:8080/appdel/SCifras_total_crimen"></script>
<script src="http://localhost:8080/appdel/SCifras_total_mes"></script>



<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="js/estadisticas.js"></script>

</body>
</html>
