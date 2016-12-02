<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type='text/css' rel="stylesheet" href="../lib/bootstrap.css" >
        <title>JSP Page</title>

    </head>

    <style>
        .content2 {
            width: 400px;
            margin: 0 auto;
            margin-top: 150px;            
        }

    </style>
    <body>
       
        <div class="content content2">
            <div class="row">
                <div class="well" style="text-align: justify" >
                    <h5>Su registro a sido procesado correctamente, su password ha sido enviado a su correo, haora pude iniciar el registor 
                            de incidentes</h5>

                    <input type="button" class="btn btn-success" onClick="location.href = 'login_user.jsp'" value="Iniciar a Registrar Incidentes" style="width:200px; height: 40px;" value='click here'>
                </div>
            </div>
        </div>

    </body>
    <script src="../lib/jquery-1.8.2.js"></script>

    <script type="text/javascript" src="../lib/bootstrap.min.js"></script>

</html>
