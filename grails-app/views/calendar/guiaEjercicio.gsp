<%@ page import="session.SessionManager" %>
<%@ page import="seguridad.Usuario" %>
<%@ page import="seguridad.Rol" %>
<%@ page import="sistema.Tipousuario" %>
<%@ page import="sistema.Clase" %>
<% 
  def smgr = new SessionManager(request.session) 
  def usuario = smgr.getCurrentUser() 
  def rol = smgr.getCurrentRol() 
  def nombreRol = rol.nombrerol 

  def nombre = usuario.getNombre()
  def apellido = usuario.getApellido() 

  def rolProf = Rol.findByNombrerol("ROL_PROF") 
  def profesores = Usuario.findAllByRol(rolProf) 
%>

<!DOCTYPE html>
<html>
<head>
  <title>Damon | Iniciar sesión</title>
  <meta charset="utf-8">
  <asset:javascript src="jquery.js"/>  
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Importando bootstrap desde internet y una fuente -->

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

  <!-- Esto es lo que se importa localmente en la aplicacion -->
  <asset:javascript src="funcionLogout.js"/>
  <asset:stylesheet src="estilosLogin.css"/>
  <asset:javascript src="funcionCalendar.js"/>

  <link rel="icon" href="logotab.png">  
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
        <li class="active"><a href="/damonAplicacion/calendar/guiaEjercicio" class="color-me">Guias ejercicios</a></li>
      </ul>
         <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
       <li><a class="color-me dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>${nombre} ${apellido} <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
            <% 
            if (nombreRol == "ROL_USUARIO"){
            %>
            <li><a data-toggle="modal" href="/damonAplicacion/calendar/misDatos">Mis Datos</a></li>
            <%
            }
            %>
            <% if (nombreRol == "ROL_PROF"){
            %>
            <li><a data-toggle="modal" href="/damonAplicacion/profview/misDatos">Mis Datos</a></li>
            <%
            }
            %>
            </ul>
        <li><a href="#" id="botonLogout" class="color-me"><span class="glyphicon glyphicon-user"></span>Cerrar Sesión</a></li>
      </ul>
    </div>
    </div>
  </div>
</nav>

<div class="row">

  <div class="videos">
  <p class="tvideos">Doble Unders</p>
  <iframe align="left" width="400" height="300" src="https://www.youtube.com/embed/Zyvusyli-UU"></iframe>
  </div>
  <div class="videos">
  <p class="tvideos">Burpee</p>
  <iframe align="left" width="400" height="300" src="https://www.youtube.com/embed/TU8QYVW0gDU"></iframe>
  </div>
  <div class="videos">
  <p class="tvideos">Jumping Jacks</p>
  <iframe align="left" width="400" height="300" src="https://www.youtube.com/embed/iSSAk4XCsRA"></iframe>
  </div>
  <div class="videos">
  <p class="tvideos">Clean</p>
  <iframe align="left" width="400" height="300" src="https://www.youtube.com/embed/EKRiW9Yt3Ps"></iframe>
  </div>
  <div class="videos">
  <p class="tvideos">Clean & Jerk</p>
  <iframe align="left" width="400" height="300" src="https://www.youtube.com/embed/8miqQQJEsO0"></iframe>
  </div>
  <div class="videos">
  <p class="tvideos">Clean & Pull</p>
  <iframe align="left" width="400" height="300" src="https://www.youtube.com/embed/1WuSiyM-knI"></iframe>
  </div>
  <div class="videos">
  <p class="tvideos">Hang Clean</p>
  <iframe align="left" width="400" height="300" src="https://www.youtube.com/embed/eVWbmwSg5CE"></iframe>
  </div>
  <div class="videos">
  <p class="tvideos">Snatch</p>
  <iframe align="left" width="400" height="300" src="https://www.youtube.com/embed/UBc5N_-xdqo"></iframe>
  </div>
  <div class="videos">
  <p class="tvideos">KB Clean</p>
  <iframe align="left" width="400" height="300" src="https://www.youtube.com/embed/cPYfiwpUeSE"></iframe>
  </div>
  <div class="videos">
  <p class="tvideos">KB Snatch</p>
  <iframe align="left" width="400" height="300" src="https://www.youtube.com/embed/6l2Iu26oWW8"></iframe>
  </div>
  <div class="videos">
  <p class="tvideos">KB Push Press</p>
  <iframe align="left" width="400" height="300" src="https://www.youtube.com/embed/_jXUPoIjBKU"></iframe>
  </div>
  <div class="videos">
  <p class="tvideos">Squats</p>
  <iframe align="left" width="400" height="300" src="https://www.youtube.com/embed/UXJrBgI2RxA"></iframe>
  </div>
  <div class="videos">
  <p class="tvideos">Pistols</p>
  <iframe align="left" width="400" height="300" src="https://www.youtube.com/embed/PxNHR5K8610"></iframe>
  </div>
  <div class="videos">
  <p class="tvideos">Kipping Pull Up's</p>
  <iframe align="left" width="400" height="300" src="https://www.youtube.com/embed/YKJvwfZ4sWo"></iframe>
  </div>
  <div class="videos">
  <p class="tvideos">Muscle Up</p>
  <iframe align="left" width="400" height="300" src="https://www.youtube.com/embed/zBPQrMCQYiE"></iframe>
  </div>
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
        <p><span class="glyphicon glyphicon-pushpin"></span> Av. Siempre Viva </p>
        <p><span class="glyphicon glyphicon-phone"></span> 03489-567893 </p>
        <p><span class="glyphicon glyphicon-envelope"></span> damon@damon.com </p>

        <p>Ing. Sistemas de Informacion - UTN FRD &copy; 2016</p>
      </div>
  </p>
</footer>


</body>
</html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>