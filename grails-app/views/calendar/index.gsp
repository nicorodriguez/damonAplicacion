<%@ page import="session.SessionManager" %>
<%@ page import="seguridad.Usuario" %>
<%@ page import="seguridad.Rol" %>
<% def smgr = new SessionManager(request.session) %>
<% def usuario = smgr.getCurrentUser() %>
<% def nombre = usuario.getNombre() %>
<% def apellido = usuario.getApellido() %>
<% def rol = smgr.getCurrentRol() %>
<% def nombreRol = rol.nombrerol %>

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

  <asset:javascript src="funcionLogout.js"/>
  <asset:javascript src="funcionCalendar.js"/>
	<asset:stylesheet src="estiloCalendar.css"/>

	<title>Damon | Calendario</title>
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
      %{-- <img src="assets\images\favicon.ico" class="img-rounded" width="45" height="45"> --}%      
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/damonAplicacion/calendar/misDatos" class="color-me"><span class="glyphicon glyphicon-user"></span>${nombre} ${apellido}</a></li>
        <li><a href="#" id="botonLogout" class="color-me"><span class="glyphicon glyphicon-user"></span>Cerrar Sesión</a></li>
      </ul>
    </div>
  </div>
</nav>

   <div class="row">
            <div class="col-md-7" id="calendario">
               <div class="panel panel-primary" id="panel1">
                     <div class="panel-heading">Calendario</div>
                        <div sclass="panel-body">
                              <table class="table" id="tbUsuario">
                                    <tr class="semana">
                                       <td></td>
                                       <td>Lunes</td>
                                       <td>Martes</td>
                                       <td>Miércoles</td>
                                       <td>Jueves</td>
                                       <td>Viernes</td>
                                       <td>Sábados</td>
                                    </tr>
                                    <tr>
                                       <td class="horarios">9:00</td>
                                       <td></td>
                                       <td></td>
                                       <td></td>
                                       <td></td>
                                       <td></td>
                                       <td></td>
                                    </tr>
                           			<tr>
                                       <td class="horarios">10:00</td>
                                       <td></td>
                                       <td></td>
                                       <td></td>
                                       <td></td>
                                       <td></td>
                                       <td></td>
                                    </tr>
                           			<tr>
                                       <td class="horarios">11:00</td>
                                       <td></td>
                                       <td></td>
                                       <td></td>
                                       <td></td>
                                       <td></td>
                                       <td></td>
                                    </tr>
                           			<tr>
                                       <td class="horarios">12:00</td>
                                       <td></td>
                                       <td></td>
                                       <td></td>
                                       <td></td>
                                       <td></td>
                                       <td></td>
                                    </tr>
                                    <tr>
                                       <td class="horarios">13:00</td>
                                       <td></td>
                                       <td></td>
                                       <td></td>
                                       <td></td>
                                       <td></td>
                                       <td></td>
                                    </tr>
                                    <tr>
                                       <td class="horarios">14:00</td>
                                       <td>Columna 2</td>
                                       <td>Columna 3</td>
                                       <td>Columna 4</td>
                                       <td>Columna 5</td>
                                       <td>Columna 6</td>
                                       <td>Columna 7</td>
                                    </tr>
                                    <tr>
                                       <td class="horarios">15:00</td>
                                       <td>Columna 2</td>
                                       <td>Columna 3</td>
                                       <td>Columna 4</td>
                                       <td>Columna 5</td>
                                       <td>Columna 6</td>
                                       <td>Columna 7</td>
                                    </tr>
                                    <tr>
                                       <td class="horarios">16:00</td>
                                       <td>Columna 2</td>
                                       <td>Columna 3</td>
                                       <td>Columna 4</td>
                                       <td>Columna 5</td>
                                       <td>Columna 6</td>
                                       <td>Columna 7</td>
                                    </tr>
                                    <tr>
                                       <td class="horarios">17:00</td>
                                       <td>Columna 2</td>
                                       <td>Columna 3</td>
                                       <td>Columna 4</td>
                                       <td>Columna 5</td>
                                       <td>Columna 6</td>
                                       <td>Columna 7</td>
                                    </tr>
                              </table>                                
                        </div>
                     </div>
         <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Crear Clase</button>

          <!-- Modal -->
          <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="dias">Dia</label>
                        <select class="form-control" id="dias">
                          <option value="0" disabled selected>-- Seleccionar --</option>
                          <option value="1">Lunes</option>
                          <option value="2">Martes</option>
                          <option value="3">Miercoles</option>
                          <option value="4">Jueves</option>
                          <option value="5">Viernes</option>
                          <option value="6">Sabados</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label for="horario">Horario</label>
                        <input type="email" class="form-control" id="remail" placeholder="nombre@ejemplo.com" required>
                        <div class="form-group">
                          <label for="email">Profesor</label>
                          <select class="form-control" id="profesor">
                              <option value="0" disabled selected>-- Seleccionar --</option>
                              <option value="1">David</option>
                              <option value="2">Herni</option>
                              <option value="3">China</option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="email">Tipo de Usuarios</label>
                          <select class="form-control" id="profesor">
                              <option value="0" disabled selected>-- Seleccionar --</option>
                              <option value="1">KIDS</option>
                              <option value="2">CROSSFITERO</option>
                              <option value="3">ATLETA</option>
                          </select>
                      </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                  <button type="button" class="btn btn-primary" onclick="crearClase()">Crear Clase</button>
                </div>
              </div>
            </div>
          </div>
          <!-- Fin de Modal -->

          </div>
      <div class="col-md-3" id="clases">
        %{-- <% if (nombreRol == "ROL_ADMIN"){ %> --}%
        <% if (nombreRol == "ROL_ADMIN"){ %>
        
          <div>
          <button type="button" class="btn btn-primary btn-lg">Usuarios</button>
          </div>
          <div>
          <button type="button" class="btn btn-primary btn-lg">Profesores</button>
          </div>
          <div>
          <button type="button" class="btn btn-primary btn-lg">Clases</button>
          </div>
          <div>
          <button type="button" class="btn btn-primary btn-lg">Servicios</button>
          </div>

        <% } %>

         <div class="panel panel-info">
                     <div class="panel-heading">Clases Anotadas</div>
                        <div class="panel-body">      
                                    <nav>
                                          <ul id="anotado">
                                          <li></li>
                                          </ul>
                                    </nav>
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