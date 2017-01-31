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

  def tipoUsuarioActual = usuario.tipo
  
  def claseLista2 = Clase.findAllByTipo(tipoUsuarioActual)

  def listaHora2 = []
  for (Clase item: claseLista2){
    def clase2 = Clase.get(item.id)
    def hora2 = clase2.getHora()
    listaHora2 << hora2  
  }
  def listaHoraP2 = listaHora2.unique()
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

  <script type="text/javascript" href="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>

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
     <asset:image src="logo.png" class="img-rounded" width="45" height="45"/>    
    </div>
     <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/damonAplicacion" class="color-me">Inicio</a></li>
        <li class="active"><a href="/damonAplicacion/calendar/guiaEjercicio" class="color-me">Guias ejercicios</a></li>
    </ul>
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
                                   <g:each var="horarios" in="${listaHoraP2}">
                                    <tr class="semana">
                                       <td>${horarios}</td>
                                       <td>
                                       <g:each var="clase" in="${claseLista2}">
                                       <g:if test="${clase.getDia()=="lunes" && clase.getHora()==horarios}">
                                       <a class="modal" onclick='anotarse("${clase.tipo.nombre}","${clase.getFecha()}","${clase.getHora()}")'>${clase.tipo.nombre}</a>
                                       </g:if>
                                       </g:each>
                                       </td>
                                       <td>
                                       <g:each var="clase" in="${claseLista2}">
                                       <g:if test="${clase.getDia()=="martes" && clase.getHora()==horarios}">
                                       <a  onclick='anotarse("${clase.tipo.nombre}","${clase.getFecha()}","${clase.getHora()}")'>${clase.tipo.nombre}</a>
                                       </g:if>
                                       </g:each>
                                       </td>
                                       <td>
                                       <g:each var="clase" in="${claseLista2}">
                                       <g:if test="${clase.getDia()=="miércoles" && clase.getHora()==horarios}">
                                       <a onclick='anotarse("${clase.tipo.nombre}","${clase.getFecha()}","${clase.getHora()}")'>
                                       ${clase.tipo.nombre}
                                       </a>
                                       </g:if>
                                       </g:each>
                                       </td>
                                       <td>
                                       <g:each var="clase" in="${claseLista2}">
                                       <g:if test="${clase.getDia()=="jueves" && clase.getHora()==horarios}">
                                       <a onclick='anotarse("${clase.tipo.nombre}","${clase.getFecha()}","${clase.getHora()}")'>${clase.tipo.nombre}</a>
                                       </g:if>
                                       </g:each>
                                       </td>
                                       <td>
                                       <g:each var="clase" in="${claseLista2}">
                                       <g:if test="${clase.getDia()=="viernes" && clase.getHora()==horarios}">
                                       <a onclick='anotarse("${clase.tipo.nombre}","${clase.getFecha()}","${clase.getHora()}")'>${clase.tipo.nombre}</a>
                                       </g:if>
                                       </g:each>
                                       </td>
                                       <td>
                                       <g:each var="clase" in="${claseLista2}">
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
    </script>
</body>
</html>