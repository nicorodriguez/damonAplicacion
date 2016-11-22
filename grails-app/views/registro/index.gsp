<!DOCTYPE html>
<html lang="en">
<head>
  <title>Damon | Registrate</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  
  <asset:javascript src="jquery.js"/>
  <asset:stylesheet src="estilosRegistro.css"/>
  <asset:javascript src="funcionRegistro.js"/>
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

      <img src="logo.png" class="img-rounded" width="45" height="45">      
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#" class="color-me">Home</a></li>
        <li><a href="#" id="ntext" class="color-me">Quienes Somos</a></li>
        <li><a href="#" class="color-me">Gimnasios</a></li>
        <li><a href="#" class="color-me">Contacto</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
       <!-- <li><a href="#" class="color-me"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li> -->
        <li><a href="#" data-toggle="modal" data-target="#login-modal" class="color-me" id="vlogin"><span class="glyphicon glyphicon-log-in"></span> ¿Tienes cuenta? Iniciar sesión</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">
  <h2>Registro</h2>
  <form>
   <div class="col-sm-4" style="padding-left:0px">
    <div class="form-group">
      <label for="nombre">Nombre:</label> 
      <input type="text" class="form-control" id="nombre" placeholder="Ingresar Nombre" maxlength="16" required>
    </div>
    <div class="form-group">
      <label for="apellido">Apellido:</label>
      <input type="text" class="form-control" id="apel" placeholder="Ingresar Apellido" maxlength="16" required>
    </div>
    <div class="form-group">
      <label for="Sexo">Sexo:</label>
    <div class="checkbox">
       <label class="radio-inline"><input type="radio" name="optradio" required="">Femenino</label>
       <label class="radio-inline"><input type="radio" name="optradio" required="">Masculino</label> 
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
        <option value="" disabled selected>-- Seleccionar --</option>
        <option value="0">2 Veces por semana</option>
        <option value="1">3 veces por semana</option>
        <option value="3">Pase libre</option>
      </select>
      <br>
      <button type="submit" class="btn btn-sm btn-success" id="botonRegistrarse" style="font-size:medium;">Registrarme!</button>
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