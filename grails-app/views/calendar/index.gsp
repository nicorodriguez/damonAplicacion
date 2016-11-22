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
      <img src="assets\images\favicon.ico" class="img-rounded" width="45" height="45">      
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#" class="color-me"><span class="glyphicon glyphicon-user"></span>Usuario</a></li>
        <li><a href="#" id="botonLogout" class="color-me"><span class="glyphicon glyphicon-user"></span>Cerrar Sesión</a></li>
      </ul>
    </div>
  </div>
</nav>

   <div class="row">
            <div class="col-md-7" id="calendario">
               <div class="panel panel-primary" id="panel1">
                     <div class="panel-heading">Calendario para anotarse</div>
                        <div sclass="panel-body">
                              <table class="table" id="tbUsuario">
                                    <tr>
                                       <td><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></td>
                                       <td>Lunes</td>
                                       <td>Martes</td>
                                       <td>Miercoles</td>
                                       <td>Jueves</td>
                                       <td>Viernes</td>
                                       <td>Sabados</td>
                                    </tr>
                                    <tr>
                                       <td>9:00</td>
                                       <td>Columna 2</td>
                                       <td>Columna 3</td>
                                       <td>Columna 4</td>
                                       <td>Columna 5</td>
                                       <td>Columna 6</td>
                                       <td>Columna 7</td>
                                    </tr>
                           			<tr>
                                       <td>10:00</td>
                                       <td>Columna 2</td>
                                       <td>Columna 3</td>
                                       <td>Columna 4</td>
                                       <td>Columna 5</td>
                                       <td>Columna 6</td>
                                       <td>Columna 7</td>
                                    </tr>
                           			<tr>
                                       <td>11:00</td>
                                       <td>Columna 2</td>
                                       <td>Columna 3</td>
                                       <td>Columna 4</td>
                                       <td>Columna 5</td>
                                       <td>Columna 6</td>
                                       <td>Columna 7</td>
                                    </tr>
                           			<tr>
                                       <td>12:00</td>
                                       <td>Columna 2</td>
                                       <td>Columna 3</td>
                                       <td>Columna 4</td>
                                       <td>Columna 5</td>
                                       <td>Columna 6</td>
                                       <td>Columna 7</td>
                                    </tr>
                                    <tr>
                                       <td>13:00</td>
                                       <td>Columna 2</td>
                                       <td>Columna 3</td>
                                       <td>Columna 4</td>
                                       <td>Columna 5</td>
                                       <td>Columna 6</td>
                                       <td>Columna 7</td>
                                    </tr>
                                    <tr>
                                       <td>14:00</td>
                                       <td>Columna 2</td>
                                       <td>Columna 3</td>
                                       <td>Columna 4</td>
                                       <td>Columna 5</td>
                                       <td>Columna 6</td>
                                       <td>Columna 7</td>
                                    </tr>
                                    <tr>
                                       <td>15:00</td>
                                       <td>Columna 2</td>
                                       <td>Columna 3</td>
                                       <td>Columna 4</td>
                                       <td>Columna 5</td>
                                       <td>Columna 6</td>
                                       <td>Columna 7</td>
                                    </tr>
                                    <tr>
                                       <td disabled>16:00</td>
                                       <td>Columna 2</td>
                                       <td>Columna 3</td>
                                       <td>Columna 4</td>
                                       <td>Columna 5</td>
                                       <td>Columna 6</td>
                                       <td>Columna 7</td>
                                    </tr>
                                    <tr>
                                       <td>17:00</td>
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
               </div>
      <div class="col-md-3" id="clases">
         <div class="panel panel-info">
                     <div class="panel-heading">Clases Anotadas</div>
                        <div class="panel-body">      
                                    <nav>
                                          <ul id="anotado">
                                             <li>Probando</li>
                                             <li>La lista</li>
                                             <li>inicialmente tiene que estar vacia!!!</li>
                                             <li>Creado</li>
                                             <li>A</li>
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