<!DOCTYPE html>
<html lang="en">
<head>
  <title>Damon | Quienes Somos</title>
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

  <div class="container-fluid">

      <div>
      <h1 align="center">Quienes Somos?</h1>

            <div class="col-sm-4">
        <div class="w3-center" style="max-width:800px">
          <asset:image src="box.jpg" width="435" height="300"/>
        </div>
        <!--
        <div class="w3-center" align="center">
          <div class="w3-section">
            <button class="w3-btn" onclick="plusDivs(-1)">❮ Anterior</button>
            <button class="w3-btn" onclick="plusDivs(1)">Siguiente ❯</button>
          </div>
          <button class="w3-btn demo" onclick="currentDiv(1)">1</button> 
          <button class="w3-btn demo" onclick="currentDiv(2)">2</button> 
          <button class="w3-btn demo" onclick="currentDiv(3)">3</button> 
        </div>
        -->
      </div>
      
      <div class="col-sm-7">
      <p> En Damon es un box de Crossfit, aqui el entrenamiento se basa en los movimientos funcionales, es decir, movimientos utilizados en la vida cotidiana. Lo único que necesitamos es tu motivación. En nuestro Box no encontrarás máquinas, no las utilizamos porque creemos que no hay máquina mejor que tu cuerpo; y con eso trabajamos. Aprenderás a moverte, a saltar, a correr y a levantar pesos, te sentirás fuerte, ágil, rápido y más vivo que nunca. Nuestra motivación es tu mejora.</p>
      
      <p> Damon es un espacio para hacer sentir tu cuerpo como nunca lo has sentido. Tenemos anillas, cuerdas, cajas de salto, barras y discos, trineos, pelotas medicinales, kettlebells y mucho más para que disfrutes de nuestras instalaciones. Nuestros entrenadores te ayudarán en todo el proceso de aprendizaje, queremos enseñarte tu potencial y no hay otra manera posible de hacerlo.</p>

      <p> Veni a conocernos, danos una oportunidad y entra en nuestra comunidad.</p>
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
     
  </p>
</footer>

</body>
</html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-red", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-red";
}
</script>
