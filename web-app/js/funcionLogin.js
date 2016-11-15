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

function enviaJSON(em,pas){
	var parametros = {
			email: em,
			password: pas
		};
	$.post( "/damonAplicacion/Login/index", parametros);  //metodo index

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