<%@ page import="session.SessionManager" %>
<%@ page import="seguridad.Usuario" %>
<%@ page import="seguridad.Rol" %>
<%@ page import="sistema.Tipousuario" %>
<%@ page import="sistema.Clase" %>
<%@ page import="seguridad.Servicio" %>
<% 
  def smgr = new SessionManager(request.session) 
  def usuario = smgr.getCurrentUser() 
  def rol = smgr.getCurrentRol() 
  def nombreRol = rol.nombrerol 

  def nombre = usuario.getNombre()
  def apellido = usuario.getApellido() 
%>

<!DOCTYPE html>
<html>
<head>
	<g:javascript src="jquery.js"/>

   <!-- Latest compiled and minified CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

   <!-- Optional theme -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

   <!-- Latest compiled and minified JavaScript -->
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>

 
  <asset:javascript src="funcionLogout.js"/>
  <asset:javascript src="funcionCalendar.js"/>
	<asset:stylesheet src="estiloCalendar.css"/> 

  <script type="text/javascript" href="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>

	<title>Damon | Administrar Servicio</title>
</head>
<body>

<nav class="navbar navbar-dark bg-primary">
  <div class="container-fluid">
    <div class="navbar-header">
    <!-- <a class="navbar-brand" href="#">Damon</a> -->
    <a class="navbar-brand mb-0" type="text">Damon</a>
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
     <asset:image src="logo.png" class="img-rounded" width="45" height="45"/>    
    </div>
     <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/damonAplicacion/adminview/index" class="color-me">Inicio</a></li>
    </ul>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a class="color-me dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>${nombre} ${apellido} <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
            <li><a data-toggle="modal" href="/damonAplicacion/adminview/misDatos">Mis Datos</a></li>
            <li><a data-toggle="modal" href="/damonAplicacion/adminview/panelDeControl">Panel de Control</a></li>
            </ul>
        <li><a href="#" id="botonLogout" class="color-me"><span class="glyphicon glyphicon-user"></span>Cerrar Sesión</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="row">
     <h1>Servicios</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:form action="busquedaServicio" method="GET" style="padding: 1em; border-radius: 0.6em; margin: 2em 2em 1em; width: 90%; border: 0.2em solid rgb(238, 238, 238); height: 2em;">
                <fieldset class="form" style="left: 7em; top: -0.75em;">
                    <div>
                        <g:textField name="parametro" placeholder="Buscar servicio por nombre" maxlength="30" value="${params.parametro }" style="width: 52%;"/>
                        %{-- <input id="quiero" name="parametro" placeholder="Buscar usuario por email" maxlength="30" value="${params.parametro}" style="width: 52%;"> --}%
                    </div>
                </fieldset>
                <g:submitButton name="buscar" class="save" value="Buscar" style="position: relative; left: 37em; top: -3.65em;" />
                
            </g:form>
            
            <table>
                <thead>
                    <tr>
                    
                        <g:sortableColumn property="nombreservicio" title="${message(code: 'servicio.nombreservicio.label', default: 'Nombre Servicio')}" />
                    
                        <g:sortableColumn property="cantidadcreditos" title="${message(code: 'servicio.cantidadcreditos.label', default: 'Cantidad Creditos')}" />
                                                       
                    </tr>
                </thead>
                <tbody>
                 <g:if test="${!listaFiltrada }">
                     <g:set var="listaFiltrada" value="${Servicio.list()}"></g:set>
                 </g:if>
                 <g:each in="${listaFiltrada}" status="i" var="servicioInstance">
                     <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    
                         <td>${servicioInstance.nombreservicio}</td>
                    
                         <td>${servicioInstance.cantidadcreditos}</td>
                              
                     </tr>
                 </g:each>
                 </tbody>
             </table>

             <g:if test="${listaFiltrada.size()==1}">
             <button>Guardar!</button>
             </g:if>
            </div>      


</div>

	</div>

   <div id="footer"></div>
<hr>
<footer class="container-fluid text">
  <p>
      <div class="footer-right">
        <a href="#"><i class="fa fa-facebook"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-github"></i></a>

      </div>

      <div class="footer-left">
        <!-- <p><a href="#"><span class="glyphicon glyphicon-envelope"></span></a>Envelope icon as a link: </p> -->
        <p><font size="2"><span class="glyphicon glyphicon-pushpin"></span> San Martin 1171 | <span class="glyphicon glyphicon-phone"></span> 03489 42-0400 | <span class="glyphicon glyphicon-envelope"></span> damon@damon.com </font> </p>
        <p><font size="2">Ing. Sistemas de Informacion - UTN FRD &copy; 2016</font></p>
      </div>

      </p>
</footer>

</body>
</html>