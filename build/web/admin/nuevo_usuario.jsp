<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type='text/css' rel="stylesheet" href="../lib/bootstrap.css" >

        <title>Nuevo Usuario</title>
    </head>
    <style>
        .content2 {
            width: 300px;
            margin: 0 auto;
            margin-top: 105px;            
        }


        html, body {
            background-color: #333;
        }
        body {
            padding-top: 40px; 
        }

    </style>


    <body>

        <div class="content content2">
            <div class="row">               

                <form  id="formulario" class="well"  method="post"  action="<%=request.getContextPath()%>/SNuevousuario">
                    <div class="row">
                        <div class="span6">Correo Electronico</div>
                        <div class="span6"><input type="text" name="correo" value=""  id="correo" style="width: 250px" >
                        </div>
                    </div>
                    <div class="row">
                        <div class="span6">Nombre </div>
                        <div class="span6"><input type="text" name="nombre" value=""  id="nombre" style="width: 250px">
                        </div>
                    </div>
                    <div class="row">
                        <div class="span6"> Apellidos</div>
                        <div class="span6"><input type="text" name="apellidos" value=""  id="nombre" style="width: 250px">
                        </div>
                    </div>
                    <div class="row">
                        <div class="span6">Usuario</div>
                        <div class="span6"> <input type="text" name="usuario" value=""  id="usuario"  style="width: 250px">
                        </div>
                    </div>

           
                    <br>
                    <button type="submit" class="btn btn-primary" id="button">  Registrar</button>
                    <button type="reset" class="btn">Cancelar</button>
                </form>
            </div>
        </div>

    </body>
    <script src="../lib/jquery-1.8.2.js"></script>

    <script type="text/javascript" src="../lib/bootstrap.min.js"></script>


</html>
