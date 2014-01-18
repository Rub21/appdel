<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style type="text/css">

    /* Sticky footer styles
    -------------------------------------------------- */

    html,
    body {
        height: 100%;
        /* The html and body elements cannot have any padding or margin. */
    }

    /* Wrapper for page content to push down footer */
    #wrap {
        min-height: 100%;
        height: auto !important;
        height: 100%;
        /* Negative indent footer by it's height */
        margin: 0 auto -60px;
    }

    /* Set the fixed height of the footer here */
    #push,
    #footer {
        height: 60px;
    }
    #footer {
        background-color: #f5f5f5;
    }

    /* Lastly, apply responsive CSS fixes as necessary */
    @media (max-width: 767px) {
        #footer {
            margin-left: -20px;
            margin-right: -20px;
            padding-left: 20px;
            padding-right: 20px;
        }
    }



    /* Custom page CSS
    -------------------------------------------------- */
    /* Not required for template or sticky footer method. */

    #wrap > .container {
        padding-top: 60px;
    }
    .container .credit {
        margin: 20px 0;
    }

    code {
        font-size: 80%;
    }

    .cabecera{
        position: fixed;
        top: 0px;
        z-index: 1039;
        width: 100%;
        height: 30px;
        background: #fff;
        text-align: center;  

    }
    .cabecera a{
        font-size: 20px;
    }



</style>
<!-- Fixed navbar -->
<div class="cabecera"> <a class="brand" href="#">Registre incidencia delincuenciales en Ayacucho</a> </div>

<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>           
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li>
                        <a  href="registrar.jsp">Registrar Incidentes</a>
                    </li>
                    <%
                        String rol = (String) request.getSession().getAttribute("rolusuario");

                        if (rol.equals("RA")) {
                    %>
                    <li>
                        <a href="puntos_critico.jsp"  >Puntos críticos</a>
                    </li>
                    <li>
                        <a href="puntos_vigilancia.jsp"   >Puntos de vigilancia</a>
                    </li>
                    <li>
                        <a href="admin_incidentes.jsp"   >Administrar incidentes</a>
                    </li>
                    <%}%>

                </ul>

                <div  class="nav pull-right" >
                    <p style="color: #000"> Bienvenido :<spam>${usuario}</spam> </p>
                    <a class="cerrar_sesion" href="${pageContext.request.contextPath}/SCerrarsesion_users">Cerrar Sesion</a>
                </div>
            </div>
        </div>
    </div>
</div>