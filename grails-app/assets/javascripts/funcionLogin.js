var x;
x=$(document)
x.ready(inicializarEventosLogin);

function inicializarEventosLogin(){
	
	//simula que con un enter, el usuario apreta el boton "ingresar"

	$('.input').keypress(function(e) {
     if(e.which == 13) {
           $(this).blur();
           $('#submit').focus().click();
        }
   });

	var x;
	x=$("#btnLogin");
	x.click(crearParametros);

}
function crearParametros(){
	var email;
	var password;
	var emailleng
	var passleng

	email1=$("#login-email").val();
	password1=$("#login-pass").val();
	emailleng=email1.length
	passleng=password1.length

	if ((emailleng!==0) && (passleng!==0)) {
		if ((passleng > 5) && (passleng<19)) {
			if(emailleng < 46){
		enviaJSON(email1,password1);
	}else{
		alert("Error email mal ingresado")
	}	
	}else{
		alert("Error en la password")
	}
	}else{
		alert("los campos estan vacios.")
	}
}

function enviaJSON(email1,password1){
	var parametros = {
			email: email1,
			password: password1
		};
	$.post( "/damonAplicacion/login/loguearse", parametros).done(function( resp ){
		console.log(resp);
		if(resp == 1){
			$.post("/damonAplicacion/login/relocalizar").done(function( resp1 ){
				console.log(resp1);
				if (resp1 == "ADMIN"){
					window.location.href = '/damonAplicacion/adminview/index';
				}
				else{
					if (resp1 == "PROF"){
						window.location.href = '/damonAplicacion/profview/index';
					}
					else{
						if (resp1 == "USUARIO"){
							window.location.href = '/damonAplicacion/calendar/index';
						}
					}
				}

			});
			// window.location.href = '/damonAplicacion/calendar/index';
		}
		else{
			alert("Email o Contraseña incorrectos")
		}
	});

}

function probando(){
	// $.post("/damonAplicacion/calendar/formatHora")
	$.post("/damonAplicacion/calendar/probar")
} 

/*
function login(){
	$.post("/don-cangrejo/carrito/confirmarPedido").done(function( res ){
		console.log(res);
		if(res=="true"){
			var time = 300;
			Materialize.toast('Su compra se ha realizado satisfactoriamente !', 7000 , null);
			setTimeout(
   					function(){
     					window.location.reload();  
   				},time);
		}
		else{
			Materialize.toast('No se ha podido confirmar su compra, por favor primero agregue un producto', 7000 , null);
		}
	});

}
*/