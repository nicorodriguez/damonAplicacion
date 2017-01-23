<%@ page import="session.SessionManager" %>
<%@ page import="seguridad.Usuario" %>
<%@ page import="seguridad.Rol" %>
<%@ page import="sistema.Tipousuario" %>
<% def smgr = new SessionManager(request.session) %>
<% def usuario = smgr.getCurrentUser() %>
<% def nombre = usuario.getNombre() %>
<% def apellido = usuario.getApellido() %>
<% def rol = smgr.getCurrentRol() %>
<% def nombreRol = rol.nombrerol %>
<% def rolProf = Rol.findByNombrerol("ROL_PROF") %>
<% def profesores = Usuario.findAllByRol(rolProf) %>
<% def tipousuariosLista = Tipousuario.getAll() %>

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
<script src="jquery.ui.datepicker-es.js"></script>
 
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
                  <h4 class="modal-title" id="myModalLabel">Crear Clase</h4>
                </div>
                <div class="modal-body">
                      %{-- <div class="form-group">
                          <label>Fecha</label>
                          <input type="text" id="datepicker" name="fecha" />
                      </div> --}%
                      <div class="form-group">
                        <label for="dias">Dia</label>
                        <select class="form-control" id="dias">
                          <option disabled selected>-- Seleccionar --</option>
                          <option>Lunes</option>
                          <option>Martes</option>
                          <option>Miercoles</option>
                          <option>Jueves</option>
                          <option>Viernes</option>
                          <option>Sabado</option>
                          <option>Domingo</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label for="horario">Horario</label>
                        <select class="form-control" id="horario">
                            <option>-- Seleccionar --</option>
                            <option>08:00</option>
                            <option>08:30</option>
                            <option>09:00</option>
                            <option>09:30</option>
                            <option>10:00</option>
                            <option>10:30</option>
                            <option>11:00</option>
                            <option>11:30</option>
                            <option>12:00</option>
                            <option>12:30</option>
                            <option>13:00</option>
                            <option>13:30</option>
                            <option>14:00</option>
                            <option>14:30</option>
                            <option>15:00</option>
                            <option>15:30</option>
                            <option>16:00</option>
                            <option>16:30</option>
                            <option>17:00</option>
                            <option>17:30</option>
                            <option>18:00</option>
                            <option>18:30</option>
                            <option>19:00</option>
                            <option>19:30</option>
                            <option>20:00</option>
                            <option>20:30</option>
                            <option>21:00</option>
                            <option>21:30</option>
                            <option>22:00</option>
                            <option>22:30</option>
                        </select>
                        <div class="form-group">
                          <label for="email">Profesor</label>
                          <select class="form-control" id="profesor">
                              <option value="0" disabled selected>-- Seleccionar --</option>
                              <g:each var="profesor" in="${profesores}">
                              <option value="${profesor.email}">${profesor.nombre}</option>
                              </g:each>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="email">Tipo de Usuarios</label>
                          <select class="form-control" id="tipo">
                              <option value="0" disabled selected>-- Seleccionar --</option>
                              <g:each var="tipos" in="${tipousuariosLista}">
                              <% if ("${tipos.nombre}" != "PENDIENTE"){ %>
                                <% if ("${tipos.nombre}" != "ADMIN"){ %>
                                  <option value="${tipos.nombre}">${tipos.nombre}</option>
                                <% } %>
                              <% } %>
                              </g:each>
                          </select>
                      </div>
                      <div class="form-group">
                          <label>Fecha</label>
                          <input type="text" id="datepicker" name="fecha" />
                      </div>
                      <div class="form-group nom">
                        <label for="cantidad">Cantidad Máxima:</label>
                        <input type="text" class="form-control" id="cant" placeholder="Ingresar cantidad" maxlength="2" required>
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

<script>
$(function () {
$.datepicker.setDefaults($.datepicker.regional["ar"]);
$("#datepicker").datepicker({
  dateFormat: "dd/mm/yy",
  minDate: "0D",
  maxDate: "+7D"
});
});
    </script>
</body>
</html>