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


  // def rolProf = Rol.findByNombrerol("ROL_PROF") 
  // def profesores = Usuario.findAllByRol(rolProf) 

  def tipoUsuarioActual = usuario.tipo
  
  def claseLista2 = Clase.findAllByTipo(tipoUsuarioActual)

  def claseAnot = []
  def listaHora2 = []

  for (Clase item: claseLista2){
    def clase2 = Clase.get(item.id)
    def hora2 = clase2.getHora()
    listaHora2 << hora2
    def listaClasee = []
    listaClasee = clase2.anotados
    
    for (Usuario item2: listaClasee){
      busid = item2.id
      if (busid.equals(usuario.id)){
        claseAnot << clase2
      }
    }
  }

  def claseAnotP = claseAnot.unique()
  
  def listaHoraP2 = listaHora2.unique()

  def numDia = usuario.getNumdiaactual()

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
        <li class="active"><a href="/damonAplicacion/calendar" class="color-me">Inicio</a></li>
        <li class="active"><a href="/damonAplicacion/calendar/guiaEjercicio" class="color-me">Guias ejercicios</a></li>
    </ul>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a class="color-me dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>${nombre} ${apellido} <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
            <li><a data-toggle="modal" href="/damonAplicacion/calendar/misDatos">Mis Datos</a></li>
            </ul>
        <li><a href="#" id="botonLogout" class="color-me"><span class="glyphicon glyphicon-user"></span>Cerrar Sesión</a></li>
      </ul>
    </div>
  </div>
</nav>

  <div class="alert alert alert-success"  id="confirmar"><p class="text-center" id="confirmText"><b>¡Exito!</b> Se realizo el registro correctamente.</p></div>
  <div class="alert alert-danger"  id="error"><p class="text-center" id="errorText"><b>¡Error!</b> Verifica los campos en rojo para poder continuar. .</p></div>
  
<div class="row">
            <div class="col-md-7" id="calendario">
               <div class="panel panel-primary" id="panel1">
                     <div class="panel-heading">Calendario</div>
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
                                   <g:each var="horarios" in="${listaHoraP2}">
                                    <tr class="semana">
                                       <td>${horarios}</td>
                                       <td>
                                       <g:each var="clase" in="${claseLista2}">
                                       <g:if test="${clase.getNumdia()=="1" && clase.getHora()==horarios}">
                                       <g:if test="${clase.getNumdia()>=numDia}">
                                       <a onclick='anotarse("${clase.tipo.nombre}","${clase.getFecha()}","${clase.getHora()}")'>
                                       </g:if>
                                       ${clase.tipo.nombre} ${clase.profe.nombre}
                                       <g:if test="${clase.getNumdia()>=numDia}">
                                       </a>
                                       </g:if>
                                       </g:if>
                                       </g:each>
                                       </td>
                                       <td>
                                       <g:each var="clase" in="${claseLista2}">
                                       <g:if test="${clase.getNumdia()=="2" && clase.getHora()==horarios}">
                                       <g:if test="${clase.getNumdia()>=numDia}">
                                       <a onclick='anotarse("${clase.tipo.nombre}","${clase.getFecha()}","${clase.getHora()}")'>
                                       </g:if>
                                       ${clase.tipo.nombre} ${clase.profe.nombre}
                                       <g:if test="${clase.getNumdia()>=numDia}">
                                       </a>
                                       </g:if>
                                       </g:if>
                                       </g:each>
                                       </td>
                                       <td>
                                       <g:each var="clase" in="${claseLista2}">
                                       <g:if test="${clase.getNumdia()=="3" && clase.getHora()==horarios}">
                                       <g:if test="${clase.getNumdia()>=numDia}">
                                       <a onclick='anotarse("${clase.tipo.nombre}","${clase.getFecha()}","${clase.getHora()}")'>
                                       </g:if>
                                       ${clase.tipo.nombre} ${clase.profe.nombre}
                                       <g:if test="${clase.getNumdia()>=numDia}">
                                       </a>
                                       </g:if>
                                       </g:if>
                                       </g:each>
                                       </td>
                                       <td>
                                       <g:each var="clase" in="${claseLista2}">
                                       <g:if test="${clase.getNumdia()=="4" && clase.getHora()==horarios}">
                                       <g:if test="${clase.getNumdia()>=numDia}">
                                       <a onclick='anotarse("${clase.tipo.nombre}","${clase.getFecha()}","${clase.getHora()}")'>
                                       </g:if>
                                       ${clase.tipo.nombre} ${clase.profe.nombre}
                                       <g:if test="${clase.getNumdia()>=numDia}">
                                       </a>
                                       </g:if>
                                       </g:if>
                                       </g:each>
                                       </td>
                                       <td>
                                       <g:each var="clase" in="${claseLista2}">
                                       <g:if test="${clase.getNumdia()=="5" && clase.getHora()==horarios}">
                                       <g:if test="${clase.getNumdia()>=numDia}">
                                       <a onclick='anotarse("${clase.tipo.nombre}","${clase.getFecha()}","${clase.getHora()}")'>
                                       </g:if>
                                       ${clase.tipo.nombre} ${clase.profe.nombre}
                                       <g:if test="${clase.getNumdia()>=numDia}">
                                       </a>
                                       </g:if>
                                       </g:if>
                                       </g:each>
                                       </td>
                                       <td>
                                       <g:each var="clase" in="${claseLista2}">
                                       <g:if test="${clase.getNumdia()=="6" && clase.getHora()==horarios}">
                                       <g:if test="${clase.getNumdia()>=numDia}">
                                       <a onclick='anotarse("${clase.tipo.nombre}","${clase.getFecha()}","${clase.getHora()}")'>
                                       </g:if>
                                       ${clase.tipo.nombre} ${clase.profe.nombre}
                                       <g:if test="${clase.getNumdia()>=numDia}">
                                       </a>
                                       </g:if>
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

      <div class="col-md-4" id="clases">

        
         <div class="panel panel-info">
                     <div class="panel-heading">Clases Anotadas</div>
                        <div class="panel-body">      
                                    <nav>
                                          <ul id="anotado">
                                          <g:each var="claseanotado" in="${claseAnotP.sort{it.fechaHorario}}">
                                          %{-- <g:if test="${claseanotado.estaAnotado(usuario)==true}"> --}%
                                          <li><p id="clasesAnotadas">Anotado dia: <span id="mayus"> ${claseanotado.getDia()} ${claseanotado.getNumdiafecha()} </span> hora:<span id="mayus"> ${claseanotado.getHora()} </span> <a onclick='desanotarse("${claseanotado.tipo.nombre}","${claseanotado.getFecha()}","${claseanotado.getHora()}")'><span class="glyphicon glyphicon-remove" aria-hidden="true" style="color:red"></span></a> </p></li>
                                          %{-- </g:if> --}%
                                          </g:each>
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
    </script>
</body>
</html>