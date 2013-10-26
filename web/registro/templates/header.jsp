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

</style>
<!-- Fixed navbar -->
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="#">Registre incidencia delincuenciales en Ayacucho</a>
            <div class="nav-collapse collapse">
                <div  class="nav pull-right" >
                    <p style="color: #000"> Bienvenido : ${usuario}</p>
                    <a class="cerrar_sesion" href="${pageContext.request.contextPath}/SCerrarsesion_users">Cerrar Sesion</a>
                </div>
            </div>
        </div>
    </div>
</div>