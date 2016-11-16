var x;
x=$(document)
x.ready(inicializarEventosLogin);

function inicializarEventosLogin(){
	var x;
	x=$("#btnLogin");
	x.click(crearParametros);
}
function crearParametros(){
	var email;
	var password;

	email1=$("#login-email").val();
	password1=$("#login-pass").val();
	
	enviaJSON(email1,password1);
}

function enviaJSON(email1,password1){
	var parametros = {
			email: email1,
			password: password1
		};
	$.post( "/damonAplicacion/login/loguearse", parametros).done(function( resp ){
		console.log(resp);
		if(resp == "true"){
			window.location.href = '/damonAplicacion/calendar/index';
		}
		else{
			alert("Email o Contraseña incorrectos")
		}
	});

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