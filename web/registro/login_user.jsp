<%-- 
    Document   : login_user
    Created on : Oct 12, 2013, 10:57:52 AM
    Author     : ruben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Iniciar Sesion</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Le styles -->
        <link type='text/css' rel="stylesheet" href="../lib/bootstrap.css" >
        <style type="text/css">
            body {
                padding-top: 40px;
                padding-bottom: 40px;
                background-color: #434648;
            }

            .form-signin {
                max-width: 300px;
                padding: 19px 29px 29px;
                margin: 0 auto 20px;
                background-color: #fff;
                border: 1px solid #e5e5e5;
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                border-radius: 5px;
                -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
            }
            .form-signin .form-signin-heading,
            .form-signin .checkbox {
                margin-bottom: 10px;
            }
            .form-signin input[type="text"],
            .form-signin input[type="password"] {
                font-size: 16px;
                height: auto;
                margin-bottom: 15px;
                padding: 7px 9px;
            }

        </style>
        <link href="../assets/css/bootstrap-responsive.css" rel="stylesheet">

    </head>

    <body>

        <div class="container">

            <form class="form-signin" method="post"  action="<%=request.getContextPath()%>/SLogin_users">
                <h2 class="form-signin-heading">Iniciar Sesion</h2>
                <input type="text"  name="user"class="input-block-level" placeholder="User">
                <input type="password" name="password" class="input-block-level" placeholder="Password">
                <label class="checkbox">
                    <input type="checkbox" value="remember-me"> Remember me
                </label>
                <button class="btn btn-primary" type="submit">Ingresar</button>
                <p style="color: red; font-size: 10px">${error}</p>
                <a href="<%=request.getContextPath()%>/users/newuser.jsp">Registrarse</a>
            </form>









        </div> <!-- /container -->
        <script src="../lib/jquery-1.8.2.js"></script>

        <script type="text/javascript" src="../lib/bootstrap.min.js"></script>


    </body>
</html>

