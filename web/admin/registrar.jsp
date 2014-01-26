<%@ page pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<%

    /*String usuario = (String) request.getSession().getAttribute("usuario");
    if (null == request.getSession().getAttribute("usuario")) {
        response.sendRedirect("login_user.jsp");
    } else {
        System.out.print("ingreso al a app");
    }*/

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
        <div id="map" style="height: 100%"></div>
        <div class="left">
            <a id="geojsonLayer"   href="#" ></a>
        </div>


        <div id="modal">
            <div id="popover" class="modal container hide fade" tabindex="-1">



                <form  id="formulario" class="modal-body content span6"  method="post"  action="<%=request.getContextPath()%>/SRegistrar" enctype="multipart/form-data" >
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

                <div class="row">
                    <div class="span4">Registrar Como:</div>
                    <div class="span4">
                        <div class="well"> 
                            <input type="radio" name="reg_como" value="${idusuario}-${usuario}" checked>${usuario} &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="reg_como" value="${idusuario}-Anonimo" > Anonimo<br>
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="span4">Tipo de Incidente o Crimen <span class="obligatorio">*</span></div>
                    <div class="span4">
                        <select name='tipo' id='tipo' align="left" >

                            <option value='Robo'>Robo</option>
                            <option value='Agresión'>Agresión</option>                                                    
                            <option value='Accidente'>Accidente</option>
                            <option value='Violencia Familiar'>Violencia Familiar</option>
                            <option value='Otros Incidentes'>Otros Incidentes</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="span4">Fecha <span class="obligatorio">*</span></div>
                    <div class="span4"> <input type="text" name="fecha" value=""  id="fecha" style="width:400px" placeholder="Haga click para mostrarla la Fecha" >
                    </div>
                </div>

                <div class="row">
                    <div class="span4">Hora <span class="obligatorio">*</span></div>
                    <div class="span4"> <input type="text" name="hora" value=""  id="hora" style="width:400px"  placeholder="Haga click para mostrarla Hora">
                    </div>
                </div>

                <div class="row">
                    <div class="span4">Descripción <span class="obligatorio">*</span></div>
                    <div class="span4">
                        <textarea name="descripcion" rows="4" cols="75"  id="descripcion" style="width:400px" placeholder="Ingrese la descripcion del incidente"></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="span4">Direcion/Referencia</div>
                    <div class="span4">
                        <textarea name="direccion" rows="2" cols="75"  id="direcion" style="width:400px" placeholder="Ingrese la direccion exacta o la referencia"></textarea>
                    </div>
                </div>

                <div class="row latlong">
                    <div class="span4">Latitud <span class="obligatorio">*</span></div>
                    <div class="span4">
                        <input type="text" name="latitud" value=""  id="latitud" placeholder="click en el Mapa" style="width:400px">
                    </div>
                    <div class="span4">Longitud <span class="obligatorio">*</span> </div>
                    <div class="span4">
                        <input type="text" name="longitud"  id="longitud" placeholder="click en el Mapa" style="width:400px">
                    </div>
                </div>
                <div class="row">
                    <div class="span4">Imagen del incidente Ocurrido<span class="obligatorio">(Opcional)</span></div>
                    <div class="span4">
                        <input type="file" name="imagen"   id="imagen"/>
                    </div>
                </div>

                <br>
                <button type="submit" class="btn btn-primary" id="button">  Registrar</button>

                <button type="button" data-dismiss="modal" class="btn ">Cancelar</button>
            </form>
        </div>
        <a href="#popover"  class="click"  data-toggle="modal"></a>
    </div>


</body>



<script src="../lib/jquery-1.8.2.js"></script>
<script src="../lib/jquery-ui.js"></script>
<script type="text/javascript" src="../lib/jquery.ptTimeSelect.js"></script>
<script src="../lib/leaflet.js"></script>
<script type="text/javascript" src="../lib/bootstrap.min.js"></script>
<script type="text/javascript" src="../lib/jquery.ptTimeSelect.js"></script>

<script type="text/javascript" src="../lib/location/L.Control.Locate.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<script type="text/javascript" src="js/app.js"></script>
<script type="text/javascript" src="js/form.js"></script>

</html>