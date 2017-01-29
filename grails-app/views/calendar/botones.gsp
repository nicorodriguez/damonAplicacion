<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */
    .navbar {
      margin-bottom: 80;
      border-radius:0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #0000;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;}
    }

    table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
    }
    th, td {
    padding: 5px;
    text-align: center;
    }

    .button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    margin: 4px 2px;
    cursor: pointer;
    }

    .button1 {
    background-color: #ffff4d; /* shelou */
    border: none;
    color: black;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    margin: 4px 2px;
    cursor: pointer;
    }

    .button3 {
    background-color: #8c1aff; /* Violet */
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    margin: 4px 2px;
    cursor: pointer;
    }
    
    .button2:hover {
    box-shadow: 0 10px 14px 0 rgba(0,0,0,0.24),0 15px 48px 0 rgba(0,0,0,0.19);
    }
  </style>
</head>
<body>

<div class="container">
<br>
          <div class="btn-group-vertical">
          <div class="btn-group">
          <button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="dropdown">Usuarios <span class="caret"></span></button>
            <ul class="dropdown-menu" role="menu">
            <li><a data-toggle="modal" href="#modalhabilitarusuario">Habilitar Usuario</a></li>
            <li><a data-toggle="modal" href="#modallistarusuario">Listar Usuarios</a></li>
            <li><a data-toggle="modal" href="#modalcambiarcat">Cambiar Categoria</a></li>
            </ul>
          </div>
          <div class="btn-group">
          <button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="dropdown">Profesores <span class="caret"></span></button>
            <ul class="dropdown-menu" role="menu">
            <li><a data-toggle="modal" href="#nuevoprofesor">Nuevo Profesor</a></li>
            <li><a data-toggle="modal" href="#listaprofesor">Listar Profesores</a></li>
            <li><a data-toggle="modal" href="#eliminarprofesor">Eliminar Profesor</a></li>
            </ul>
          </div>
          <div class="btn-group">
          <button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="dropdown">Servicios <span class="caret"></span></button>
            <ul class="dropdown-menu" role="menu">
            <li><a data-toggle="modal" href="#nuevoservicio">Nuevo Servicio</a></li>
            <li><a data-toggle="modal" href="#">Listar Servicios</a></li>
            <li><a data-toggle="modal" href="#eliminarservicio">Eliminar Servicio</a></li>
           </ul>
          </div>
          <div class="btn-group">
          <button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="dropdown">Clases <span class="caret"></span></button>
            <ul class="dropdown-menu" role="menu">
            <li><a data-toggle="modal" href="#">Nueva Clase</a></li>
            <li><a data-toggle="modal" href="#">Listar Clases</a></li>
            <li><a data-toggle="modal" href="#">Eliminar Clase</a></li>
            </ul>
          </div>
          <div class="btn-group">
          <button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="dropdown">Establecimiento <span class="caret"></span></button>
            <ul class="dropdown-menu" role="menu">
            <li><a data-toggle="modal" href="#cambiarcupo">Cupos por Categoria</a></li>
            </ul>
          </div>
          </div>
          </div>

  <!-- Modal modalhabilitarusuario -->
  <div class="modal fade" id="modalhabilitarusuario" role="dialog">
    <div class="modal-dialog">
      <!-- Modal modalhabilitarusuario content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Habilitar Usuario</h4>
        </div>
        <div class="modal-body">
          <form id="searchbox" action="">
            <p>Buscar usuario por correo: <input id="search" type="email" size="35" placeholder="Escriba correo" required="">
            <input id="submit" type="submit" value="Buscar"></p>
          </form>

          <form Name=habilitarusuario>
           <table style="width:100%">
            <caption>Datos de Usuario</caption>
            <tr>
              <th>Nombre</th>
              <th>Apellido</th>
              <th>Servicio</th>
            </tr>
            <tr>
              <td>Importar Nombre</td>
              <td>Importar Apellido</td>
              <td>Importar Servicio</td>
            </tr>
          </table>
          <br>
          <p align="center"><button type=button class="button button2" align="center"><b>HABILITAR!</b></button></p>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal modalcambiarcat -->
  <div class="modal fade" id="modalcambiarcat" role="dialog">
    <div class="modal-dialog">
      <!-- Modal modalcambiarcat content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Cambiar Categoria</h4>
        </div>
        <div class="modal-body">
          <form id="searchbox" action="">
            <p>Buscar usuario por correo: <input id="search" type="email" size="35" placeholder="Escriba correo" required="">
            <input id="submit" type="submit" value="Buscar"></p>
          </form>
          <form Name=cambiarcat>
           <table style="width:100%">
            <caption>Datos de Usuario</caption>
            <tr>
              <th>Nombre</th>
              <th>Apellido</th>
              <th>Servicio</th>
            </tr>
            <tr>
              <td>Importar Nombre</td>
              <td>Importar Apellido</td>
              <td>    
              <select class="form-control" id="sel1">
                <option value="" disabled selected>Seleccionar</option>
                <option value="0">2 x Semana</option>
                <option value="1">3 x Semana</option>
                <option value="3">Libre</option>
              </select>
              </td>
            </tr>
          </table>
          <br>
          <p align="center"><button type=button class="button button2" align="center"><b>CAMBIAR!</b></button></p>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>

    <!-- Modal nuevoprofesor -->
  <div class="modal fade" id="nuevoprofesor" role="dialog">
    <div class="modal-dialog">
      <!-- Modal nuevoprofesor content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Nuevo Profesor</h4>
        </div>
        <div class="modal-body">
          <form id="searchbox" action="">
            <p>Buscar usuario por correo: <input id="search" type="email" size="35" placeholder="Escriba correo" required="">
            <input id="submit" type="submit" value="Buscar"></p>
          </form>

          <form Name=nuevoprofesor>
           <table style="width:100%">
            <caption>Datos de Usuario</caption>
            <tr>
              <th>Nombre</th>
              <th>Apellido</th>
              <th>Categoria</th>
            </tr>
            <tr>
              <td>Importar Nombre</td>
              <td>Importar Apellido</td>
              <td>Importar Categoria(corss,atelta,kid)</td>
            </tr>
          </table>
          <br>
          <p align="center"><button type=button class="button1 button2" align="center"><b>NOMBRAR PROFESOR!</b></button></p>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>

      <!-- Modal eliminarprofesor -->
  <div class="modal fade" id="eliminarprofesor" role="dialog">
    <div class="modal-dialog">
      <!-- Modal eliminarprofesor content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Nuevo Profesor</h4>
        </div>
        <div class="modal-body">
          <form id="searchbox" action="">
            <p>Buscar usuario por correo: <input id="search" type="email" size="35" placeholder="Escriba correo" required="">
            <input id="submit" type="submit" value="Buscar"></p>
          </form>

          <form Name=eliminarprofesor>
           <table style="width:100%">
            <caption>Datos de Usuario</caption>
            <tr>
              <th>Nombre</th>
              <th>Apellido</th>
              <th>Categoria</th>
            </tr>
            <tr>
              <td>Importar Nombre</td>
              <td>Importar Apellido</td>
              <td>Importar Categoria(Profesor)</td>
            </tr>
          </table>
          <br>
          <p align="center"><button type=button class="button1 button2" align="center"><b>ELIMINAR PROFESOR! *</b></button></p>
          <p align="right"><font color="gray">* Esto dejara al usuario como Crossfitero</font></p>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>

    <!-- Modal nuevoservicio -->
  <div class="modal fade" id="nuevoservicio" role="dialog">
    <div class="modal-dialog">
      <!-- Modal nuevoservicio content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Nuevo Servicio</h4>
        </div>
        <div class="modal-body">
          <form Name=nuevoservicio action="">
            <p> Nombre Servicio : <input Name=NewName type="text" minlength="4" maxlength="18" required="" /> </p>
            Cantidad de Creditos : <input type="number" class="js-number" name="someid" size="4" maxlength="2" min="0" max="30" required="" /> 
          </form>
          <br>
          <p align="center"><button type="button" class="button3 button2" align="center"><b>CREAR!</b></button></p>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>

    <!-- Modal eliminarservicio -->
  <div class="modal fade" id="eliminarservicio" role="dialog">
    <div class="modal-dialog">
      <!-- Modal eliminarservicio content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Eliminar Servicio</h4>
        </div>
        <div class="modal-body">
          <form Name=eliminarservicio action="">
            <p> Nombre Servicio : <select class="form-control" id="sel1">
                <option value="" disabled selected>Seleccionar</option>
                <option value="0">2 x Semana</option>
                <option value="1">3 x Semana</option>
                <option value="3">Libre</option>
              </select></p>
          </form>
          <br>
          <p align="center"><button type="button" class="button3 button2" align="center"><b>ELIMINAR! *</b></button></p>
          <p align="right"><font color="gray">* Esto dejara el servicio desactivado</font></p>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal cambiarcupo -->
  <div class="modal fade" id="cambiarcupo" role="dialog">
    <div class="modal-dialog">
      <!-- Modal cambiarcupo content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><b>Cupos por Categoria</b></h4>
        </div>
        <div class="modal-body" action="">
          <form Name=cambiarcupo>
              <span>Seleccione Categoria : </span><select width="250" style="width: 250px">
                <option value="" disabled selected>Seleccionar</option>
                <option value="0">Crossfitero</option>
                <option value="1">Atleta</option>
                <option value="3">Kids</option>
              </select>
              <br>
              <br>
              <p>Cupo Actual : <input type="text" class="js-number" name="someid" value="25" size="2" maxlength="2" min="0" max="30" required="" readonly="" /></p>
              <hr>
              <p>Nuevo Cupo : <input type="number" class="js-number" name="someid" maxlength="2" min="0" max="50" required="" /></p>
          </form>
          <br>
          <p align="center"><button type="button" class="button button2" align="center"><b>CONFIRMAR!</b></button></p>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>



</body>
</html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Script solo 2 numeros en cantidad de creditos -->
 <script>
    $(".js-number").bind('keydown', function(e){
       var targetValue = $(this).val();
       if (e.which ===8 || e.which === 13 || e.which === 37 || e.which === 39 || e.which === 46) { return; }


       if (e.which > 47 &&  e.which < 58  && targetValue.length < 2) {
          var c = String.fromCharCode(e.which);
          var val = parseInt(c);
          var textVal = parseInt(targetValue || "0");
          var result = textVal + val;

          if (result < 0 || result > 99) {
             e.preventDefault();
          }

          if (targetValue === "0") {
            $(this).val(val);
            e.preventDefault();
          }
       }
       else {
           e.preventDefault();
       }
    });
 </script>