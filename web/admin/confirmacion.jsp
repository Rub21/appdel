<%-- 
    Document   : confirmacion
    Created on : Oct 23, 2013, 5:16:36 PM
    Author     : ruben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link type='text/css' rel="stylesheet" href="../lib/bootstrap.css" >
    <link rel="stylesheet" href="../lib/jquery-ui.css" />
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmacion</title>
    </head>
    <body>
        <jsp:include page="templates/header.jsp"></jsp:include>
        
        <div class="container" style="margin-top: 100px">
            <div class="span3"></div>
            <div class="span6">
                <div class="well" >
                    <span style="font-size:18px;">Crimen registrado</span><br><br>
                    <p>Este incidente sera verifica por el Administrador</p>
                    <input type=button class="btn btn-danger" onClick="location.href = 'registrar.jsp'" value="Registrar otro" style="width:200px; height: 40px;" value='click here'>
                </div>
            </div>
            <div class="span3"></div>
        </div> 
    </body>
</html>
