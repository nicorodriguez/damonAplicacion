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

  def listaHora1 = []
  for (Clase item: claseLista1){
    def clase1 = Clase.get(item.id)
    def hora1 = clase1.getHora()
    listaHora1 << hora1   
  }
  def listaHoraP1 = listaHora1.unique()
%>

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

 
  <asset:javascript src="funcionLogout.js"/>
  <asset:javascript src="funcionCalendar.js"/>
	<asset:stylesheet src="estiloCalendar.css"/>
  <asset:stylesheet src="estiloAdminView.css"/> 

  <script type="text/javascript" href="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>

	<title>Damon | Admin</title>
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
        <li class="active"><a href="/damonAplicacion/adminview" class="color-me">Inicio</a></li>
    </ul>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <!--<li><a href="/damonAplicacion/calendar/misDatos" class="color-me"><span class="glyphicon glyphicon-user"></span></a></li> -->
        <li><a class="color-me dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>${nombre} ${apellido} <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
            <li><a data-toggle="modal" href="/damonAplicacion/adminview/misDatos">Mis Datos</a></li>
            <li><a data-toggle="modal" href="/damonAplicacion/adminview/panelControl">Panel de Control</a></li>
            </ul>
        <li><a href="#" id="botonLogout" class="color-me"><span class="glyphicon glyphicon-user"></span>Cerrar Sesión</a></li>
          </div>
      </ul>
    </div>
  </div>
</nav>

<div class="row">
            <div class="col-md-7" id="calendario">
                  <div class="panel panel-primary" id="panel1">
                     <div class="panel-heading">Calendario - Administrador</div>
                        <div sclass="panel-body">
                              <table class="table" id="tbUsuario">
                                <thead>
                                  <tr>
                                    <th>Horario</th>
                                    <th>Lunes</th>
                                    <th>Martes</th>
                                    <th>Miércoles</th>
                                    <th>Jueves</th>
                                    <th>Viernes</th>
                                    <th>Sábados</th>
                                  </tr>
                                </thead>
                                <tbody id="tbUsuario">
                                   <g:each var="horarios" in="${listaHoraP1}">
                                    <tr class="semana">
                                       <td>${horarios}</td>
                                       <td>
                                       <g:each var="clase" in="${claseLista1}">
                                       <g:if test="${clase.getDia()=="lunes" && clase.getHora()==horarios}">
                                       <a class="modal" onclick='anotarse("${clase.tipo.nombre}","${clase.getFecha()}","${clase.getHora()}")'>${clase.tipo.nombre}</a>
                                       </g:if>
                                       </g:each>
                                       </td>
                                       <td>
                                       <g:each var="clase" in="${claseLista1}">
                                       <g:if test="${clase.getDia()=="martes" && clase.getHora()==horarios}">
                                       <a  onclick='anotarse("${clase.tipo.nombre}","${clase.getFecha()}","${clase.getHora()}")'>${clase.tipo.nombre}</a>
                                       </g:if>
                                       </g:each>
                                       </td>
                                       <td>
                                       <g:each var="clase" in="${claseLista1}">
                                       <g:if test="${clase.getDia()=="miércoles" && clase.getHora()==horarios}">
                                       <a onclick='anotarse("${clase.tipo.nombre}","${clase.getFecha()}","${clase.getHora()}")'>
                                       ${clase.tipo.nombre}
                                       </a>
                                       </g:if>
                                       </g:each>
                                       </td>
                                       <td>
                                       <g:each var="clase" in="${claseLista1}">
                                       <g:if test="${clase.getDia()=="jueves" && clase.getHora()==horarios}">
                                       <a onclick='anotarse("${clase.tipo.nombre}","${clase.getFecha()}","${clase.getHora()}")'>${clase.tipo.nombre}</a>
                                       </g:if>
                                       </g:each>
                                       </td>
                                       <td>
                                       <g:each var="clase" in="${claseLista1}">
                                       <g:if test="${clase.getDia()=="viernes" && clase.getHora()==horarios}">
                                       <a onclick='anotarse("${clase.tipo.nombre}","${clase.getFecha()}","${clase.getHora()}")'>${clase.tipo.nombre}</a>
                                       </g:if>
                                       </g:each>
                                       </td>
                                       <td>
                                       <g:each var="clase" in="${claseLista1}">
                                       <g:if test="${clase.getDia()=="sábados" && clase.getHora()==horarios}">
                                       <a onclick='anotarse("${clase.tipo.nombre}","${clase.getFecha()}","${clase.getHora()}")'>${clase.tipo.nombre}</a>
                                       </g:if>
                                       </g:each>
                                       </td>                              
                                    </tr>
                                  </g:each>
                                  </tbody>
                              </table>                                
                        </div>
                     </div>
      

         
          </div>

      <div class="col-md-3" id="clases">
       
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
            <li><a data-toggle="modal" data-dismiss="modal" aria-label="Close" href="#crearClase">Nueva Clase</a></li>
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

      <!-- Modal Crear Clases -->

  <div class="modal fade" id="crearClase" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title" id="myModalLabel">Crear Clase</h4>
                </div>
                <div class="modal-body">
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
                          <input type="text" id="fecha" name="fecha" />
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

  $.datepicker.regional['es'] = {
  closeText: 'Cerrar',
  prevText: '< Ant',
  nextText: 'Sig >',
  currentText: 'Hoy',
  monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
  monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
  dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
  dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
  dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
  weekHeader: 'Sm',
  dateFormat: 'dd/mm/yy',
  firstDay: 1,
  isRTL: false,
  showMonthAfterYear: false,
  yearSuffix: ''
  };
$.datepicker.setDefaults($.datepicker.regional["es"]);
$("#fecha").datepicker({
  dateFormat: "DD dd/mm/yy",
  minDate: "0D",
  maxDate: "+7D"
});
});
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
</body>
</html>