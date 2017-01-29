<!DOCTYPE html>
<html lang="en">
<head>
  <title>Damon | Contacto</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
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
    
    html {
    position: relative; 
    height: 100%;
    width: 100%;
    margin: 0;
    padding: 0;
    }
    body{
    margin: 0 0 1px;
    }
    /* Set black background color, white text and some padding */
    footer {
      margin: 0;
      background-color: #337ab7;
      color: white;
      width: 100%;
      bottom: 0;
     /* height: 65px; */
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;}
    }
    .color-me{
    color:white;
    }

   .navbar-brand{
    color:white;
   }


  /* #footer {
    clear: both;
    position: relative;
    z-index: 10;
    height: 3em;
    margin-top: -3em;
} */

.footer-left p{
  color:  #F8F8FF;
  font-size: 16px;
  margin: 2;
} 

.footer-right{
  float: right;
  margin-top: 6px;
  max-width: 180px;
}

.footer-right a{
  display: inline-block;
  width: 35px;
  height: 35px;
  background-color:  #33383b;
  border-radius: 2px;

  font-size: 20px;
  color: #ffffff;
  text-align: center;
  line-height: 35px;

  margin-left: 3px;
}


  </style>
  <link rel="icon" href="logotab.png">
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
        <li><a href="/damonAplicacion/login/quienes" id="ntext" class="color-me">¿Quiénes Somos?</a></li>
        <li><a href="/damonAplicacion/login/" class="color-me">Gimnasios</a></li>
        <li><a href="/damonAplicacion/login/contacto" class="color-me">Contacto</a></li>
      </ul>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#" class="color-me"><span class="glyphicon glyphicon-user"></span> Registrate</a></li>
        <li><a href="#" data-toggle="modal" data-target="#login-modal" class="color-me"><span class="glyphicon glyphicon-log-in"></span> Iniciar sesión</a></li>
      </ul>
    </div>
  </div>
</nav>

  <div>

      <div>
      <h1 align="center">Contacto</h1>

      <div class="col-sm-7" align="center">
      <p></p>
      </br>
      </br>
      </br>
      </br>
        <p><span class="glyphicon glyphicon-pushpin"></span> Direccion: Av. Siempre Viva </p>
        <p><span class="glyphicon glyphicon-phone"></span> Telefono: 03489-567893 </p>
        <p><span class="glyphicon glyphicon-envelope"></span> Mail: damon@damon.com </p>
        <p><span class="glyphicon glyphicon-time"></span> Atencion: Lunes a Viernes - 8 a 20 hs. </p>
      </div>
      <div class="col-sm-4">
        <iframe align="right" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3300.7348563863234!2d-58.96416478429271!3d-34.17869604264128!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95bb722bd263ff79%3A0x24d0268115af6719!2sUTN-FRD%2C+Universidad+Tecnol%C3%B3gica+Nacional+-+Facultad+Regional+Delta!5e0!3m2!1ses-419!2sar!4v1480896966075" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
      </div>
    </div>
  </div>



<div id="footer"></div>
<hr>
<!-- <footer class="container-fluid text">
  <p>
      <div class="footer-right">
        <a href="#"><i class="fa fa-facebook"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-github"></i></a>

      </div>

      <div class="footer-left">
        <p><span class="glyphicon glyphicon-pushpin"></span> Av. Siempre Viva </p>
        <p><span class="glyphicon glyphicon-phone"></span> 03489-567893 </p>
        <p><span class="glyphicon glyphicon-envelope"></span> damon@damon.com </p>

        <p>Ing. Sistemas de Informacion - UTN FRD &copy; 2016</p>
      </div>

      </p>
</footer>
-->

</body>
</html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>