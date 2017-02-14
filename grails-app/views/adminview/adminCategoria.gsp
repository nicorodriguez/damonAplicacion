<%@ page import="session.SessionManager" %>
<%@ page import="seguridad.Usuario" %>
<%@ page import="seguridad.Rol" %>
<%@ page import="sistema.Tipousuario" %>
<%@ page import="sistema.Clase" %>
<%@ page import="seguridad.Servicio" %>
<% 
  def smgr = new SessionManager(request.session) 
  def user = smgr.getCurrentUser()
  def usuario = Usuario.get(user.id)
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
	<asset:stylesheet src="adminUsuario.css"/>
  <asset:javascript src="adminServicio.js"/> 

  <script type="text/javascript" href="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>

	<title>Damon | Administrar Categoria</title>
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

<div class="container">
     <h2>Categoria</h2>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:form action="busquedaTipo" method="GET" >
                <fieldset class="form" style="left: 7em; top: -0.75em;">
                    <div>
                        <p><input id="quiero" name="parametro" placeholder="Buscar servicio por nombre" maxlength="30" value="${params.parametro}" style="width: 52%;">
                        <g:submitButton name="buscar" class="save" value="Buscar"/></p>
                    </div>
                </fieldset>  
            </g:form>

            <table>
                <thead>
                    <tr>
                    
                        <g:sortableColumn property="nombre" title="${message(code: 'tipousuario.nombre.label', default: 'Nombre Categoria')}" />
                                    
                    </tr>
                </thead>
                <tbody>
                 <g:if test="${!listaFiltrada }">
                     <g:set var="listaFiltrada" value="${Tipousuario.list()}"></g:set>
                 </g:if>
                 <g:each in="${listaFiltrada}" status="i" var="tipoInstance">
                     <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    
                         <td id="nombre">${tipoInstance.nombre}</td>
                             
                     </tr>
                 </g:each>
                 </tbody>
             </table>

%{--              <g:if test="${listaFiltrada.size()==1}">
             <button onclick="crearCategoria()">Guardar!</button>
             </g:if> --}%
            </div>      
</div>
	</div>
  <hr>
  <p align="center">
  <button type="button" class="button button2" data-toggle="modal" data-target="#nuevaCategoria">Nueva Categoria</button>
  <button type="button" class="button4 button2" data-toggle="modal" data-target="#eliminarCategoria">Eliminar Categoria</button>
  </p>


      <!-- Modal nuevaCategoria -->
  <div class="modal fade" id="nuevaCategoria" role="dialog">
    <div class="modal-dialog">
      <!-- Modal nuevaCategoria content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Nueva Categoria</h4>
        </div>
        <div class="modal-body">
          <form Name=nuevoservicio action="">
            <p> Nombre Categoria : <input Name=NewName type="text" minlength="4" maxlength="30" required="" size="50" /> </p>
          </form>
          <br>
          <p align="center"><button type="button" class="button button2" align="center"><b>CREAR!</b></button></p>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>

        <!-- Modal eliminarCategoria -->
  <div class="modal fade" id="eliminarCategoria" role="dialog">
    <div class="modal-dialog">
      <!-- Modal eliminarCategoria content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Eliminar Categoria</h4>
        </div>
        <div class="modal-body">
          <form Name=eliminarCategoria action="">
            <p> Nombre Categoria : <select class="form-control" id="sel1">
                <option value="" disabled selected>Seleccionar</option>
                <option value="0">ATLETA</option>
                <option value="1">KIDS</option>
                <option value="3">CROSSFITERO</option>
              </select></p>
          </form>
          <br>
          <p align="center"><button type="button" class="button4 button2" align="center"><b>ELIMINAR!</b></button></p>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>


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