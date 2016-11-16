<!DOCTYPE html>	
<html>
<head>

	<title>Damon CF</title>
	<asset:javascript src="jquery.js"/>
	<asset:javascript src="bootstrap.js"/>
	<asset:stylesheet src="bootstrap.css"/>
	<asset:stylesheet src="estilosLogin.css"/>
	<asset:javascript src="jcryption.js"/>
	<!--<asset:javascript src="convenience.js"/>-->
	<asset:javascript src="funcionLogin.js"/> <!--  LINEA IMPORTANTE PAR Q LINKEE ARCHIVOS JS DE ARAFUE -->
</head>
<body>
<header>
 		<h1 class="text-center">SISTEMA DE SESION - DAMON CF</h1>
</header>

<div class="login">
		<div class="login-screen">
			<div class="app-title text-center">
				<h1>Login</h1>
			</div>

			<div class="login-form" id="valor1">
				<div class="control-group">
				<input type="text" class="login-field center-block input-lg" value="rodrigueznicolas.9319@gmail.com" placeholder="Email" id="login-email">
				<label class="login-field-icon fui-user" for="login-name"></label>
				</div>

				<div class="control-group">
				<input type="password" class="login-field center-block input-lg" value="1234567" placeholder="Password" id="login-pass">
				<label class="login-field-icon fui-lock" for="login-pass"></label>
				</div>
			<div class="btn-group-vertical center-block" id="Botones">

				<a class="btn btn-info btn-lg btn" id="btnLogin1" onclick="crearParametros()">Login</a>
				
				<a class="btn btn-primary btn-lg btn" href='/damonAplicacion/registro/index' id="botonesRegistro">Registrarse</a>

			</div>
				<p class="text-center" id="ocultado">Usuario o contraseña incorrectos</p>
				<p class="text-center"><a class="login-link" href="#">¿Olvidaste tu Password?</a></p>
		</div>
	</div>

</body>
</html>