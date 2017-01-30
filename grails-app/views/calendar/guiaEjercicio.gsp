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

  def tipousuariosLista = Tipousuario.getAll()

  def tipoUsuarioActual = usuario.tipo

  def claseLista1 = Clase.getAll()
  
  def claseLista2 = Clase.findAllByTipo(tipoUsuarioActual)
  

  def listaHora1 = []
  for (Clase item: claseLista1){
    def clase1 = Clase.get(item.id)
    def hora1 = clase1.getHora()
    listaHora1 << hora1   
  }
  def listaHoraP1 = listaHora1.unique()

  def listaHora2 = []
  for (Clase item: claseLista2){
    def clase2 = Clase.get(item.id)
    def hora2 = clase2.getHora()
    listaHora2 << hora2  
  }
  def listaHoraP2 = listaHora2.unique()
%>
<!DOCTYPE html>
<html>
<head>
  <title>Damon | Iniciar sesión</title>
  <meta charset="utf-8">  
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Importando bootstrap desde internet y una fuente -->

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

  <!-- Esto es lo que se importa localmente en la aplicacion -->
  <asset:javascript src="jquery.js"/>
  <asset:stylesheet src="estilosLogin.css"/>
  <asset:javascript src="funcionLogin.js"/>

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
        <li><a href="/damonAplicacion/calendar/misDatos" class="color-me"><span class="glyphicon glyphicon-user"></span>${nombre} ${apellido}</a></li>
        <li><a href="#" id="botonLogout" class="color-me"><span class="glyphicon glyphicon-user"></span>Cerrar Sesión</a></li>
      </ul>
    </div>
    </div>
  </div>
</nav>

</div>

<div class="row">
<div class="embed-responsive embed-responsive-4by3">
  <iframe class="embed-responsive-item" src="https://www.youtube.com/watch?v=LI_0iBFxoto&t=1043s"></iframe>
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