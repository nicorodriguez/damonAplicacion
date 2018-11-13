<%@ page import="session.SessionManager" %>
<%@ page import="seguridad.Usuario" %>
<%@ page import="seguridad.Rol" %>
<%@ page import="sistema.Tipousuario" %>
<%@ page import="sistema.Clase" %>
<% 
  def smgr = new SessionManager(request.session) 
  def user = smgr.getCurrentUser()
  def usuario = Usuario.get(user.id)
  def rol = smgr.getCurrentRol() 
  def nombreRol = rol.nombrerol 

  def nombre = usuario.getNombre()
  def apellido = usuario.getApellido() 

  def email = usuario.getEmail()
  def sexo = usuario.getSexo()
  def serv = usuario.getServ()
  def tipo = usuario.getTipo()

  def nombreTipo = tipo.nombre
  def nombreServ = serv.nombreservicio
  
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
	<asset:stylesheet src="estiloMisDatos.css"/>
  <asset:javascript src="funcionMisDatosCalendar.js"/> 

  <script type="text/javascript" href="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>

	<title>Damon | Mis Datos</title>
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
        <li class="active"><a href="/damonAplicacion/calendar" class="color-me">Inicio</a></li>
    </ul>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a class="color-me dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>${nombre} ${apellido} <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
            <li><a data-toggle="modal" href="/damonAplicacion/calendar/misDatos">Mis Datos</a></li>
            </ul>
        <li><a href="#" id="botonLogout" class="color-me"><span class="glyphicon glyphicon-user"></span>Cerrar Sesión</a></li>
      </ul>
    </div>
  </div>
</nav>


  <div>
<div class="container">
      <div class="container-fluid">
      <h2>Mis Datos</h2>

      <div id="Info">
        <p>
            <strong>Nombre:</strong>
            <span>${nombre}</span>
            <button type="button" class="btn-default" data-toggle="modal" data-target="#modalnombre">Editar</button>
        </p>
        <br>
        <p>
            <strong>Apellido:</strong>
            <span>${apellido}</span>
            <button type="button" class="btn-default" data-toggle="modal" data-target="#modalapellido">Editar</button>
        </p>
        <br>

        <br>
        <p>
            <strong>Servicio:</strong>
            <span>${nombreServ}<strong>(*)</strong></span>
        </p>
        <br>
        <p>
            <strong>Categoria:</strong>
            <span>${nombreTipo}<strong>(*)</strong></span>
        </p>
        <br>
  <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modalcontraseña">Cambiar Contraseña</button>
%{--   <button type="button" class="btn btn-default">Volver</button> --}%



  <!-- Modal modalnombre -->
  <div class="modal fade" id="modalnombre" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal modalnombre content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Cambio de Nombre</h4>
        </div>
        <div class="modal-body">
          <form Name=Nombre>
            <p> Nombre : <input id="nom" Name=NewName type="text" minlength="3" maxlength="16" required=""> </p>
            <input type="button" onclick="envioNombre()" Value="Cambiar Nombre">
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>

   <!-- Modal modalapellido -->
  <div class="modal fade" id="modalapellido" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal modalapellido content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Cambio de Apellido</h4>
        </div>
        <div class="modal-body">
          <form Name=Apellido>
            <p> Apellido : <input Name=NewName type="text" minlength="3" maxlength="16" required> </p>
            <input type="button" onclick="envioApe()" Value="Cambiar Apellido">
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>

  <!-- Modal modalcontraseña -->
  <div class="modal fade" id="modalcontraseña" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal modalcontraseña content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Cambio de Contraseña</h4>
        </div>
        <div class="modal-body">
          <form Name=Password>
            <p> Contraseña : <input Name=OldPassword type="Password" minlength="6" maxlength="18" required> </p>
            <p> Nueva Contraseña : <input Name=NewPassword type="Password" minlength="6" maxlength="18" required> </p>
            <p> Repita Nueva Contraseña : <input Name=NewPassword type="Password" minlength="6" maxlength="18" required=""> </p>
            <input type=button onclick="ChangePassword()" Value="Cambiar Contraseña">
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
    </div>


    </div>
  </div>
  </div>
  <br>
  <br>
  <div align="center">
  <s type="text-bold"> Los campos que contengan <strong>(*)</strong> para cambiarse debe contactarse con el Administrador</s>
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