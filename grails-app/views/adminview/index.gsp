<%@ page import="session.SessionManager" %>
<%@ page import="seguridad.Usuario" %>
<%@ page import="seguridad.Rol" %>
<%@ page import="sistema.Tipousuario" %>
<%@ page import="sistema.Clase" %>
<%@ page import="seguridad.Servicio" %>
<% 
  def smgr = new SessionManager(request.session) 
  def user = smgr.getCurrentUser()
  def usuario = Usuario.get(user.id)
  def rol = smgr.getCurrentRol() 
  def nombreRol = rol.nombrerol 

  def nombre = usuario.getNombre()
  def apellido = usuario.getApellido() 

  def rolProf = Rol.findByNombrerol("ROL_PROF") 
  def profesores = Usuario.findAllByRol(rolProf) 

  def tipousuariosLista = Tipousuario.getAll()

  def tipoUsuarioActual = usuario.tipo

  def claseLista1 = Clase.getAll()  

  // def listaHora1 = []

  def listaHoraNueva = Clase.listaOrdenada()

  // for (Clase item: claseLista1){
  //   def clase1 = Clase.get(item.id)
  //   def hora1 = clase1.getHora()
  //   listaHora1 << hora1
  // }

  // def listaHoraP1 = listaHora1.unique()

  def listaServ = Servicio.getAll()
  def listaTipo = Tipousuario.getAll()
  def listaUser = Usuario.getAll()

  Date lun = usuario.iniciarLunesAnt()

  def listadias = []

  String diafecha = usuario.getDiaFecha(lun)

  listadias << diafecha
  Date sig = lun.plus(1)
  String diafecha1 = usuario.getDiaFecha(sig)
  listadias << diafecha1
  Date sig1 = lun.plus(2)
  String diafecha2 = usuario.getDiaFecha(sig1)
  listadias << diafecha2
  Date sig2 = lun.plus(3)
  String diafecha3 = usuario.getDiaFecha(sig2)
  listadias << diafecha3
  Date sig3 = lun.plus(4)
  String diafecha4 = usuario.getDiaFecha(sig3)
  listadias << diafecha4
  Date sig4 = lun.plus(5)
  String diafecha5 = usuario.getDiaFecha(sig4)
  listadias << diafecha5

  def listadiasP = listadias.unique()

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
  <asset:javascript src="adminUsuarios.js"/>

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
            <li><a data-toggle="modal" href="/damonAplicacion/adminview/panelDeControl">Panel de Control</a></li>
            </ul>
        <li><a href="#" id="botonLogout" class="color-me"><span class="glyphicon glyphicon-user"></span>Cerrar Sesión</a></li>
          </div>
      </ul>
    </div>
  </div>
</nav>

<div class="alert alert alert-success"  id="confirmar"><p class="text-center" id="confirmText"><b>¡Exito!</b> Se realizo el registro correctamente.</p></div>
<div class="alert alert-danger"  id="error"><p class="text-center" id="errorText"><b>¡Error!</b> Verifica los campos en rojo para poder continuar. .</p></div>
  

<div class="row">
            <div class="col-md-7" id="calendario">
                  <div class="panel panel-primary" id="panel1">
                     <div class="panel-heading">Calendario - Administrador</div>
                        <div sclass="panel-body">
                              <table class="table" id="tbUsuario">
                                <thead>
                                  <tr>
                                    <th>Horario</th>
                                    <g:each var="dia" in="${listadiasP}">
                                    <th>${dia}</th>
                                    </g:each>
                                  </tr>
                                </thead>
                                <tbody id="tbUsuario">
                                   <g:each var="horarios" in="${listaHoraNueva}">
                                    <tr class="semana">
                                       <td>${horarios}</td>
                                       <td>
                                       <g:each var="clase" in="${claseLista1}">
                                       <g:if test="${clase.getNumdia()=="1" && clase.getHora()==horarios}">
                                       <p>${clase.tipo.nombre}: ${clase.cantidadActual}/${clase.cantidadMax} ${clase.profe.nombre}</p>
                                       </g:if>
                                       </g:each>
                                       </td>
                                       <td>
                                       <g:each var="clase" in="${claseLista1}">
                                       <g:if test="${clase.getNumdia()=="2" && clase.getHora()==horarios}">
                                       <p>${clase.tipo.nombre}: ${clase.cantidadActual}/${clase.cantidadMax} ${clase.profe.nombre}</p>
                                       </g:if>
                                       </g:each>
                                       </td>
                                       <td>
                                       <g:each var="clase" in="${claseLista1}">
                                       <g:if test="${clase.getNumdia()=="3" && clase.getHora()==horarios}">
                                       <p>${clase.tipo.nombre}: ${clase.cantidadActual}/${clase.cantidadMax} ${clase.profe.nombre}</p>
                                       </g:if>
                                       </g:each>
                                       </td>
                                       <td>
                                       <g:each var="clase" in="${claseLista1}">
                                       <g:if test="${clase.getNumdia()=="4" && clase.getHora()==horarios}">
                                       <p>${clase.tipo.nombre}: ${clase.cantidadActual}/${clase.cantidadMax} ${clase.profe.nombre}</p>
                                       </g:if>
                                       </g:each>
                                       </td>
                                       <td>
                                       <g:each var="clase" in="${claseLista1}">
                                       <g:if test="${clase.getNumdia()=="5" && clase.getHora()==horarios}">
                                       <p>${clase.tipo.nombre}: ${clase.cantidadActual}/${clase.cantidadMax} ${clase.profe.nombre}</p>
                                       </g:if>
                                       </g:each>
                                       </td>
                                       <td>
                                       <g:each var="clase" in="${claseLista1}">
                                       <g:if test="${clase.getNumdia()=="6" && clase.getHora()==horarios}">
                                       <p>${clase.tipo.nombre}: ${clase.cantidadActual}/${clase.cantidadMax} ${clase.profe.nombre}</p>
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
          <div class="btn-group botones">
            <button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="dropdown">Clases <span class="caret"></span></button>
            <ul class="dropdown-menu" role="menu">
            <li><a data-toggle="modal" data-dismiss="modal" aria-label="Close" href="#crearClase">Nueva Clase</a></li>
            <li><a data-toggle="modal" href="#eliminarClase">Eliminar Clase</a></li>
            </ul>
          </div>
          <div class="btn-group">
            <button type="button" class="btn btn-primary btn-lg" onclick="window.location.href='/damonAplicacion/adminview/adminUsuario'">Administrar Usuarios</button>
          </div>
          <div class="btn-group">
            <button type="button" class="btn btn-primary btn-lg" onclick="window.location.href='/damonAplicacion/adminview/adminServicio'">Servicios</button>
          </div>
          <div class="btn-group">
            <button type="button" class="btn btn-primary btn-lg" onclick="window.location.href='/damonAplicacion/adminview/adminCategoria'">Categoria</button>
          </div>
          %{-- <div class="btn-group">
          <button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="dropdown">Establecimiento <span class="caret"></span></button>
            <ul class="dropdown-menu" role="menu">
            <li><a data-toggle="modal" href="#cambiarcupo">Cupos por Categoria</a></li>
            </ul>
          </div> --}%
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
                                  <% if ("${tipos.nombre}" != "PROFESOR"){ %>
                                  <option value="${tipos.nombre}">${tipos.nombre}</option>
                                  <% } %>
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

        <!-- Modal Eliminar Clase -->
           <div class="modal fade" id="eliminarClase" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title" id="myModalLabel">Eliminar Clase</h4>
                </div>
                <div class="modal-body">
                          <label for="horario">Clase a eliminar: </label>
                        <select class="form-control" id="elimClase">
                            <option value="" disabled selected >-- Seleccionar --</option>
                            <g:each var="claseee" in="${claseLista1.sort{it.tipo}}">
                            <option value="${claseee.id}">
                              Tipo: ${claseee.tipo.nombre} || Dia: ${claseee.getDiaFecha()} || Hora: ${claseee.getHora()}
                            </option>
                            </g:each>
                        </select>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                  <button type="button" class="btn btn-primary" onclick="eliminarClase()"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span> Eliminar Clase</button>
                </div>
              </div>
            </div>
          </div>




  <!-- Modal modalcambiarserv -->
  <div class="modal fade" id="modalcambiarserv" role="dialog">
    <div class="modal-dialog">
      <!-- Modal modalcambiarserv content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Cambiar Servicio</h4>
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
              <th>Categoria</th>
            </tr>
            <tr>
              <td>Importar Nombre</td>
              <td>Importar Apellido</td>
              <td>    
              <select class="form-control" id="sel1">
                <option value="" disabled selected>Seleccionar</option>
                <option value="0">Atleta</option>
                <option value="1">Crossfitero</option>
                <option value="3">Kid</option>
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
              <td>Importar Categoria(cross,atleta,kid)</td>
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

  <!-- Modal listarprofes -->
  <div class="modal fade" id="listarprofes" role="dialog">
    <div class="modal-dialog">
      <!-- Modal listarprofes content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Lista de Profesores</h4>
        </div>
        <div class="modal-body">
        <h1>Usuarios</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:form action="busquedaProfesor" method="GET" style="padding: 1em; border-radius: 0.6em; margin: 2em 2em 1em; width: 90%; border: 0.2em solid rgb(238, 238, 238); height: 2em;">
                <fieldset class="form" style="left: 7em; top: -0.75em;">
                    <div>
                        <g:textField name="parametro" placeholder="Buscar profesor por email" maxlength="30" value="${params.parametro }" style="width: 52%;"/>
                        %{-- <input id="quiero" name="parametro" placeholder="Buscar usuario por email" maxlength="30" value="${params.parametro}" style="width: 52%;"> --}%
                    </div>
                </fieldset>
                <g:submitButton name="buscar" class="save" value="Buscar" style="position: relative; left: 37em; top: -3.65em;" />
                
            </g:form>
            
            <table>
                <thead>
                    <tr>
                    
                        <g:sortableColumn property="email" title="${message(code: 'usuario.email.label', default: 'Email')}" />
                    
                        <g:sortableColumn property="nombre" title="${message(code: 'usuario.nombre.label', default: 'Nombre')}" />
                    
                        <g:sortableColumn property="apellido" title="${message(code: 'usuario.apellido.label', default: 'Apellido')}" />

                        <g:sortableColumn property="servicio" title="${message(code: 'usuario.servicio.label', default: 'Servicio')}" />

                        <g:sortableColumn property="tipo" title="${message(code: 'usuario.tipo.label', default: 'Tipo')}" />

                        <g:sortableColumn property="estado" title="${message(code: 'estado.apellido.label', default: 'Estado')}" />
                                    
                    </tr>
                </thead>
                <tbody>
                 <g:if test="${!listaFiltrada }">
                     <g:set var="listaFiltrada" value="${profesores}"></g:set>
                 </g:if>
                 <g:each in="${listaFiltrada}" status="i" var="usuarioInstance">
                     <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    
                         <td>${usuarioInstance.email}</td>
                    
                         <td>${usuarioInstance.nombre}</td>
                    
                         <td>${usuarioInstance.apellido}</td>

                         <td>
                          <select>
                          <option id="nombreservanterior">${usuarioInstance.servicio.nombreservicio}</option>
                            <g:each in="${listaServ}" var="serv">
                              <option class="nombreserv">${serv.nombreservicio}</option>
                            </g:each>
                          </select>
                         </td>

                         <td>
                         <select>
                          <option id="nombretipoanterior">${usuarioInstance.tipo.nombre}</option>
                          <g:each in="${listaTipo}" var="tip">
                            <option class="nombretipo">${tip.nombre}</option>
                          </g:each>
                         </select>
                         </td>

                         <td>
                         <select>
                           <option id="nombreestadoanterior">${usuarioInstance.estado}</option>
                           <option class="estado">Validado</option>
                           <option class="estado">Activo</option>
                           <option class="estado">Inactivo</option>
                         </select>
                         </td>
                              
                     </tr>
                 </g:each>
                 </tbody>
             </table>

             <g:if test="${listaFiltrada.size()==1}">
             <button>Guardar!</button>
             </g:if>

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

  <!-- Modal listarservicios -->
  <div class="modal fade" id="listarservicios" role="dialog">
    <div class="modal-dialog">
      <!-- Modal listarservicios content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Lista de Servicios</h4>
        </div>
        <div class="modal-body">
           <table style="width:100%">
            <tr>
              <th>Nombre Servicio</th>
              <th>Creditos</th>
            </tr>
            <g:each var="serv" in="${listaServ}">
            <g:if test="${serv.nombreservicio!="Profesor"}">
            <tr>
              <td>${serv.nombreservicio}</td>
              <td>${serv.cantidadcreditos}</td>
            </tr>
            </g:if>
            </g:each>
          </table>
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

  %{-- <h1>Usuarios</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:form action="busquedaUsuario" method="GET" style="padding: 1em; border-radius: 0.6em; margin: 2em 2em 1em; width: 90%; border: 0.2em solid rgb(238, 238, 238); height: 2em;">
                <fieldset class="form" style="left: 7em; top: -0.75em;">
                    <div>
                        <g:textField name="parametro" placeholder="Buscar usuario por email" maxlength="30" value="${params.parametro }" style="width: 52%;"/>
                    </div>
                </fieldset>
                <g:submitButton name="buscar" class="save" value="Buscar" style="position: relative; left: 37em; top: -3.65em;" />
                
            </g:form>
            
            <table>
                <thead>
                    <tr>
                    
                        <g:sortableColumn property="email" title="${message(code: 'usuario.email.label', default: 'Email')}" />
                    
                        <g:sortableColumn property="nombre" title="${message(code: 'usuario.nombre.label', default: 'Nombre')}" />
                    
                        <g:sortableColumn property="apellido" title="${message(code: 'usuario.apellido.label', default: 'Apellido')}" />

                        <th></th>
                                    
                    </tr>
                </thead>
                <tbody>
                 <g:if test="${!listaFiltrada }">
                     <g:set var="listaFiltrada" value="${Usuario.list()}"></g:set>
                 </g:if>
                 <g:each in="${listaFiltrada}" status="i" var="usuarioInstance">
                     <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    
                         <td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "email")}</g:link></td>
                    
                         <td>${usuarioInstance.nombre}</td>
                    
                         <td><select>
                         <option>${usuarioInstance.apellido}</option>
                         </select></td>

                         <td>Guardar!</td>
                    
                        <td>${fieldValue(bean: usuarioInstance, field: "usuario")}</td>

                    
                     </tr>
                 </g:each>
                 </tbody>
             </table>  --}%

  
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