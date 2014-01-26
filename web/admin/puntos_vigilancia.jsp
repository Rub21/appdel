<%@ page pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<%

    String usuario = (String) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login_user.jsp");
    } else {
        System.out.print("ingreso al a app");
    }

%>
<html>

    <link type='text/css' rel="stylesheet" href="../lib/bootstrap.css" >
    <link rel="stylesheet" href="../lib/jquery-ui.css" />
    <link rel="stylesheet" href="../lib/leaflet.css" />
    <!--[if lte IE 8]>
        <link rel="stylesheet" href="../lib/leaflet.ie.css" />
    <![endif]-->
    <link rel="stylesheet" href="../lib/jquery.ptTimeSelect.css" />
    <link rel="stylesheet" href="css/styles.css" />

    <!--CSS para Localizacion-->

    <link rel="stylesheet" href="../lib/location/L.Control.Locate.css" />

</head>
<body>

    <jsp:include page="templates/header.jsp"></jsp:include>

        <form  id="formulario"  method="post"  action="<%=request.getContextPath()%>/SRegistrar_puntos_vigilancia">
        <div class="container container_piuntos_vilancia">
            <div class="span2">
            </div>

            <div class="span8 well">
                <div class="container">

                    <h3>Registar puntos de vigilancia</h3>

                    
                    <input name="idusuario_usuario" value="${idusuario}-${usuario}" style="display: none" />
                    <div class="row">
                        <div class="span2">Tipo <span class="obligatorio">*</span></div>
                        <div class="span6"> <input type="text" name="tipo" value=""  id="tipo" style="width:430px">
                        </div>
                    </div>       

                    <div class="row">
                        <div class="span2">Descripción <span class="obligatorio">*</span></div>
                        <div class="span6">
                            <textarea name="descripcion" rows="4" cols="75"  id="descripcion" style="width:430px" ></textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="span2">Direción/Referencia</div>
                        <div class="span6">
                            <textarea name="direccion" rows="2" cols="75"  id="direcion" style="width:430px" ></textarea>
                        </div>
                    </div>




                    <div class="row latlong">
                        <div class="span4">Latitud <span class="obligatorio">*</span></div>
                        <div class="span4">
                            <input type="text" name="latitud" value=""  id="latitud" placeholder="click en el Mapa" style="width:430px">
                        </div>
                        <div class="span4">Longitud <span class="obligatorio">*</span> </div>
                        <div class="span4">
                            <input type="text" name="longitud"  id="longitud" placeholder="click en el Mapa" style="width:430px">
                        </div>
                    </div>




                    <div class="container">
                        <p><h5>Ubicación</h5>(Clic en el Mapa)</p>

                        <div id="map" style="height: 300px; width: 610px;"></div>
                        <div class="left">
                            <a id="geojsonLayer"   href="#" ></a>
                        </div>
                    </div>

           
                    <br>
                    <button type="submit" class="btn btn-primary" id="button">  Registrar</button>

                    <button type="button" data-dismiss="modal" class="btn ">Cancelar</button>

                </div>
            </div>
            <div class="span2">
            </div>

        </div>



    </form>

</body>



<script src="../lib/jquery-1.8.2.js"></script>
<script src="../lib/jquery-ui.js"></script>
<script type="text/javascript" src="../lib/jquery.ptTimeSelect.js"></script>
<script src="../lib/leaflet.js"></script>
<script type="text/javascript" src="../lib/bootstrap.min.js"></script>
<script type="text/javascript" src="../lib/jquery.ptTimeSelect.js"></script>
<script type="text/javascript" src="../lib/location/L.Control.Locate.js"></script>
<script type="text/javascript" src="js/app.js"></script>
<script type="text/javascript" src="js/form.js"></script>

</html>