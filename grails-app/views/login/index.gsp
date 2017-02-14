
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
        <li class="active"><a href="/damonAplicacion" class="color-me">Inicio</a></li>
        <li><a href="/damonAplicacion/login/quienes" id="ntext" class="color-me">¿Quiénes Somos?</a></li>
        <li><a href="/damonAplicacion/login/contacto" class="color-me">Contacto</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/damonAplicacion/registro/index" class="color-me"><span class="glyphicon glyphicon-user"></span> Registrate</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container" style="margin-top:30px">
<div class="col-md-12">
    <div class="modal-dialog" style="margin-bottom:0">
        <div class="modal-content">
                    <div class="panel-heading">
                        <h3 class="panel-title">Iniciar Sesión</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form">
                            <fieldset>
                                <div class="form-group">
                                   <label for="exampleInputEmail1">Email</label>
                                   <input class="form-control input" placeholder="Ingrese Email" id="login-email" name="email" value="nico55@hotmail.com" type="email" autofocus="" maxlength="50" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Contraseña <a href="LINK A OLVIDE CONTRASEÑA">(Olvide mi contraseña)</a></label>
                                    <input class="form-control input" value="12345678" placeholder="Contraseña" id="login-pass" name="password" type="password"  maxlength="18" required>
                                </div>
                                %{-- <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Recordarme
                                    </label>
                                </div> --}%
                                <a id="submit" class="btn btn-sm btn-success" style="font-size:medium;" onclick="crearParametros()">Ingresar</a>

                                %{-- <a id="submit" class="btn btn-sm btn-primary" style="font-size:medium;" onclick="probando()">ACA</a> --}%

                            </fieldset>
                        </form>
                    </div>
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
        <p><font size="2"><span class="glyphicon glyphicon-pushpin"></span> San Martin 1171 | <span class="glyphicon glyphicon-phone"></span> 03489 42-0400 | <span class="glyphicon glyphicon-envelope"></span> damon@damon.com </font> </p>
        <p><font size="2">Ing. Sistemas de Informacion - UTN FRD &copy; 2016</font></p>
      </div>

      </p>
</footer>



</body>
</html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>