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
  def email = usuario.getEmail()

  def listaServ = Servicio.getAll()
  def listaTipo = Tipousuario.getAll()
  def listaUser = Usuario.getAll() 
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
  <asset:stylesheet src="adminUsuario.css"/> 
  <asset:javascript src="adminUsuario.js"/>

  <script type="text/javascript" href="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>

	<title>Damon | Administrar Usuario</title>
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
        <li class="active"><a href="/damonAplicacion/adminview/index" class="color-me">Inicio</a></li>
    </ul>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a class="color-me dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>${nombre} ${apellido} <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
            <li><a data-toggle="modal" href="/damonAplicacion/adminview/misDatos">Mis Datos</a></li>
            <li><a data-toggle="modal" href="/damonAplicacion/adminview/panelDeControl">Panel de Control</a></li>
            </ul>
        <li><a href="#" id="botonLogout" class="color-me"><span class="glyphicon glyphicon-user"></span>Cerrar Sesión</a></li>
      </ul>
    </div>
  </div>
</nav>
    <div class="container">
     <h2>Usuarios</h2>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:form action="busquedaUsuario" method="GET" >
                <fieldset class="form" style="left: 7em; top: -0.75em;">
                    <div>
                        %{-- <g:textField name="parametro" placeholder="Buscar usuario por email" maxlength="30" value="${params.parametro }" style="width: 52%;"/> --}%
                        <p><input id="quiero" name="parametro" placeholder="Buscar usuario por email" maxlength="30" value="${params.parametro}" style="width: 52%;">
                        <g:submitButton name="buscar" class="save" value="Buscar"/></p>
                    </div>
                </fieldset>  
            </g:form>
          
            <table>
                <thead>
                    <tr>

                       <g:sortableColumn property="estado" title="${message(code: 'usuario.estado.label', default: 'Estado')}" />
                    
                        <g:sortableColumn property="email" title="${message(code: 'usuario.email.label', default: 'Email')}" />
                    
                        <g:sortableColumn property="nombre" title="${message(code: 'usuario.nombre.label', default: 'Nombre')}" />
                    
                        <g:sortableColumn property="apellido" title="${message(code: 'usuario.apellido.label', default: 'Apellido')}" />

                        <g:sortableColumn property="servicio" title="${message(code: 'usuario.servicio.label', default: 'Servicio')}" />

                        <g:sortableColumn property="tipo" title="${message(code: 'usuario.tipo.label', default: 'Tipo')}" />


                                    
                    </tr>
                </thead>
                <tbody>
                 <g:if test="${!listaFiltrada }">
                     <g:set var="listaFiltrada" value="${Usuario.list()}"></g:set>
                 </g:if>

                 <g:each in="${listaFiltrada}" status="i" var="usuarioInstance">

                  <g:if test="${usuarioInstance.email != email}">
                     <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td>
                         <select id="estado">
                           <option value="${usuarioInstance.estado}">${usuarioInstance.estado}</option>
                           <option value="v">v</option>
                           <option value="a">a</option>
                           <option value="i">i</option>
                         </select>
                         </td>
                    
                         <td id="email">${usuarioInstance.email}</td>
                    
                         <td id="nombre">${usuarioInstance.nombre}</td>
                    
                         <td id="apellido">${usuarioInstance.apellido}</td>

                         <td>
                          <select>
                            <option id="tipo">${usuarioInstance.servicio.nombreservicio}</option>
                            <option value="${usuarioInstance.servicio.nombreservicio}">
                            ${usuarioInstance.servicio.nombreservicio}
                            </option>
                            <g:if test="${usuarioInstance.servicio.nombreservicio != "Admin" && usuarioInstance.servicio.nombreservicio != "Profesor"}">
                            <g:each in="${listaServ}" var="serv">
                            <g:if test="${serv.nombreservicio != "Admin" && serv.nombreservicio != "Profesor" && serv.nombreservicio != usuarioInstance.servicio.nombreservicio}">                              
                              <option value="${serv.nombreservicio}">${serv.nombreservicio}</option>
                            </g:if>
                            </g:each>
                            </g:if>
                          </select>
                         </td>

                         <td>
                         <select>
                          <option value="${usuarioInstance.tipo.nombre}">${usuarioInstance.tipo.nombre}</option>
                          <g:if test="${usuarioInstance.tipo.nombre != "ADMIN" && usuarioInstance.tipo.nombre != "PROFESOR"}">
                          <g:each in="${listaTipo}" var="tip">
                            <g:if test="${tip.nombre != "ADMIN" && tip.nombre != "PROFESOR" && tip.nombre != "PENDIENTE" && tip.nombre != usuarioInstance.tipo.nombre}">
                            <option id="tipo" value="${tip.nombre}">${tip.nombre}</option>
                            </g:if>
                          </g:each>
                          </g:if>
                         </select>
                         </td>


                              
                     </tr>
                  </g:if>
                 </g:each>
                 </tbody>
             </table>
             <br>
            <g:if test="${listaFiltrada.size()==1}">
             <button onclick="resetCreditos()">Resetear Creditos!</button>
             </g:if>
            <hr>
             <g:if test="${listaFiltrada.size()==1}">
             <p align="center"><button type="button" class="button button2">Guardar!</button></p>
             </g:if>
            </div>      


</div>
  <div>
    <p>   Referencias Estado: p: Pendiente | v: Validado | a: Activo | i: Inactivo</p>
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