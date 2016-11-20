<!DOCTYPE html>
<html>
<head>
	<title>registro</title>
	
	<asset:javascript src="jquery.js"/>
	<asset:javascript src="bootstrap.js"/>
  <asset:javascript src="jcryption.js"/>
	<asset:stylesheet src="bootstrap.css"/>
	<asset:javascript src="funcionRegistro.js"/>
	<asset:stylesheet src="estilosRegistro.css"/>


</head>
<body>
<header>
 		<h1 class="text-center">SISTEMA DE REGISTRO - DAMON CF</h1>
</header>

<form>
  	<!-- Estos son los inputs para que se ingrese por teclado las direcciones de Email -->
    <div id="contenedor">
            <div class="form-group nom">
                <label for="valor1">Nombre</label>
              	<input type="text" class="form-control" id="nombre" placeholder="Ejemplo: Lucas Leonel">
            </div>
             <div class="form-group nom">
              	<label for="exampleInputEmail1">Apellido</label>
              	<input type="" class="form-control" id="apel" placeholder="Ejemplo: Galetti">
            </div>

             <div class="form-group correo">
              	<label for="exampleInputEmail1">Direccion de Email</label>
              	<input type="email" class="form-control" id="email" placeholder="Email">
            </div>
             <div class="form-group correo">
              	<label for="exampleInputEmail1">Repita Direccion de Email</label>
              	<input type="email" class="form-control" id="remail" placeholder="Repetir Email">
            </div>

            <div class="form-group pass">
              <label for="exampleInputPassword1">Contraseña</label>
              <input type="password" class="form-control" id="psw" placeholder="Contraseña">
            </div>

          	<div class="form-group pass">
          		<label for="exampleInputPassword1">Repetir contraseña</label>
          		<input type="password" class="form-control" id="rpsw" placeholder="Repetir Contraseña">
          	</div>

            <label for="exampleInputSelect">Elija modalidad</label>
            <select class="form-control" id="modalidad">
                <option>-- Seleccione --</option>
                <option>2 Veces por semana</option>
                <option>3 veces por semana</option>
                <option>Pase libre</option>
            </select>
            
          	 <!-- Sexo de la persona a Registrarse -->

            	<div class="form-group">
            		<label for="exampleInputEmail1">Sexo:</label>
          		<label class="checkbox-inline">
          			<input type="checkbox" id="inlineCheckbox1" value="option1"> M
          		</label>
          		<label class="checkbox-inline">
          		 	<input type="checkbox" id="inlineCheckbox2" value="option2"> F
          		</label>
          	</div>
            <div>
                  <button type="submit" class="btn btn-default" id="botonRegistrarse">Registrarse</button>
                  <a class="btn btn-info btn" href="/damonAplicacion" id="btnVolver">Volver</a>
            </div>
    </div>


</form>

</body>
</html>