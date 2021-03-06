<%@ page import="seguridad.Servicio" %>
<% def servicioLista= Servicio.getAll()%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Damon | Registro</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  
  <asset:javascript src="jquery.js"/>
  <asset:stylesheet src="estilosRegistro.css"/>
  <asset:javascript src="funcionRegistro.js"/>
  <asset:javascript src="bootbox.min.js"/>

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
        <li class="active"><a href="/damonAplicacion" class="color-me">Inicio</a></li>
        <li><a href="#" id="ntext" class="color-me">¿Quiénes Somos?</a></li>
        <li><a href="#" class="color-me">Gimnasios</a></li>
        <li><a href="#" class="color-me">Contacto</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
       <!-- <li><a href="#" class="color-me"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li> -->
       <!-- Saqué lo siguiente xq no funcionaba el href => data-target="#login-modal" -->
        <li><a href="/damonAplicacion" data-toggle="modal"  class="color-me"><span class="glyphicon glyphicon-log-in" href="/damonAplicacion" ></span> ¿Tienes cuenta? Iniciar sesión</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">

  <h2>Registro</h2>
  <form>
  <div class="alert alert alert-success"  id="confirmar"><p class="text-center" id="confirmText"><b>¡Exito!</b> Se realizo el registro correctamente.</p></div>
  <div class="alert alert-danger"  id="error"><p class="text-center" id="errorText"><b>¡Error!</b> Verifica los campos en rojo para poder continuar. .</p></div>
   <div class="col-sm-4" style="padding-left:0px">
    <div class="form-group nom">
      <label for="nombre">Nombre:</label> 
      <input type="text" class="form-control" id="nombre" placeholder="Ingresar Nombre" maxlength="16" required>
    </div>
    <div class="form-group nom">
      <label for="apellido">Apellido:</label>
      <input type="text" class="form-control" id="apel" placeholder="Ingresar Apellido" maxlength="16" required>
    </div>
    <div class="form-group">
      <label for="Sexo">Sexo:</label>
    <div class="checkbox">
       <label class="radio-inline"><input type="radio" name="optradio" required class="sexo" value="F">Femenino</label>
       <label class="radio-inline"><input type="radio" name="optradio" required class="sexo" value="M">Masculino</label> 
    </div>      
    </div>
    <div class="form-group pass">
      <label for="password">Contraseña:</label>
      <input type="password" class="form-control" id="psw" placeholder="Usa entre 6 y 18 caracteres" maxlength="18" required>
    </div>
    <div class="form-group pass">
      <label for="password">Repetir Contraseña:</label>
      <input type="password" class="form-control" id="rpsw" placeholder="Vuelva a ingresar Contraseña" maxlength="18" required>
    </div>
    <div class="form-group correo">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="nombre@ejemplo.com" required>
    </div>
    <div class="form-group correo">
      <label for="email">Repetir email:</label>
      <input type="email" class="form-control" id="remail" placeholder="nombre@ejemplo.com" required>
    </div>
    <div class="form-group">
     <!-- <div class="col-sm-4" style="padding-left:0px"> -->
      <label for="email">Modalidad:</label>
      <select class="form-control" id="modalidad">
          <option value="0" disabled selected id="modalidad">-- Seleccionar --</option>
          <g:each var="servicio" in="${servicioLista}">
          <% if (("${servicio.nombreservicio}" != "Profesor") && ("${servicio.nombreservicio}" != "Admin")){ %>
          <option value="${servicio.nombreservicio}">${servicio.nombreservicio}</option>
          <% } %>
        </g:each>
      </select>
      <br>
      <button type="submit" class="btn btn-sm btn-success" id="botonRegistrarse" style="font-size:medium;">Registrarme!</button>
      <a class="btn btn-sm btn-primary" style="font-size:medium;" href="/damonAplicacion">Volver</a>
  <!-- class="btn btn-primary" -->
    </div>
    </div>
  </form>
</div>

</div>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>