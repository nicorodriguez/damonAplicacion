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

  def listaServ = Servicio.getAll()
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
  <asset:javascript src="adminServicio.js"/> 

  <script type="text/javascript" href="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>

	<title>Damon | Administrar Servicio</title>
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
     <h2>Servicios</h2>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:form action="busquedaServicio" method="GET" >
                <fieldset class="form" style="left: 7em; top: -0.75em;">
                    <div>
                        %{-- <g:textField name="parametro" placeholder="Buscar usuario por email" maxlength="30" value="${params.parametro }" style="width: 52%;"/> --}%
                        <p><input id="quiero" name="parametro" placeholder="Buscar servicio por nombre" maxlength="30" value="${params.parametro}" style="width: 52%;">
                        <g:submitButton name="buscar" class="save" value="Buscar"/></p>
                    </div>
                </fieldset>  
            </g:form>
            
            <table>
                <thead>
                    <tr>
                    
                        <g:sortableColumn property="nombreservicio" title="${message(code: 'servicio.nombreservicio.label', default: 'Nombre Servicio')}" />
                    
                        <g:sortableColumn property="cantidadcreditos" title="${message(code: 'servicio.cantidadcreditos.label', default: 'Cantidad Creditos')}" />
                                                       
                    </tr>
                </thead>
                <tbody>
                 <g:if test="${!listaFiltrada }">
                     <g:set var="listaFiltrada" value="${Servicio.list()}"></g:set>
                 </g:if>

                 <g:each in="${listaFiltrada}" status="i" var="servicioInstance">
                  <g:if test="${servicioInstance.nombreservicio != "Admin" && servicioInstance.nombreservicio != "Profesor"}">

                     <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    
                         <td id="nombre">${servicioInstance.nombreservicio}</td>
                    
                         <td id="cantCreditos">${servicioInstance.cantidadcreditos}</td>
                              
                     </tr>
                  </g:if>
                 </g:each>
                 </tbody>
             </table>
%{--              <g:if test="${listaFiltrada.size()==1}">
             <button onclick="crearServicio()">Guardar</button>
             </g:if> --}%
            </div>      
</div>
	</div>
  <hr>
  <p align="center">
  <button type="button" class="button button2" data-toggle="modal" data-target="#nuevoservicio">Nuevo Servicio</button>
  <button type="button" class="button4 button2" data-toggle="modal" data-target="#eliminarservicio">Eliminar Servicio</button>
  </p>



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
            Cantidad de Creditos : <input type="number" class="js-number" name="someid" size="2" maxlength="2" min="0" max="31" required="" /> 
          </form>
          <br>
          <p align="center"><button type="button" class="button button2" align="center"><b>CREAR!</b></button></p>
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
            <p> Nombre Servicio : <select class="form-control" id="nomServ">
                <option value="" disabled selected>Seleccionar</option>
                <g:each in="${listaServ}" var="serv">
                    <g:if test="${serv.nombreservicio != "Admin" && serv.nombreservicio != "Profesor"}">                      
                        <option value="${serv.nombreservicio}">${serv.nombreservicio}</option>
                  </g:if>
                </g:each>
              </select></p>
          </form>
          <br>
          <p align="center"><button onclick="eliminarServicio()" type="button" class="button4 button2" align="center"><b>ELIMINAR!</b></button></p>
%{--           <p align="right"><font color="gray">* Esto dejara el servicio desactivado</font></p> --}%
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>

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
 <script>
    $(".js-number").bind('keydown', function(e){
       var targetValue = $(this).val();
       if (e.which ===8 || e.which === 13 || e.which === 37 || e.which === 39 || e.which === 46) { return; }

       if ((e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode >= 96 && e.keyCode <= 105) && targetValue.length < 2)  {
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