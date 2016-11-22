
var x;
x=$(document);
x.ready(inicializarEventosRegistro);

function inicializarEventosRegistro(){
	
	var x;
	x=$("#botonLogout");
	x.click(logout);

}

function logout(){
	$.post( "/damonAplicacion/login/logout").done(function( resp ){
		console.log(resp);
		if(resp == "true"){
			$(location).attr('href', 'http://localhost:8080/damonAplicacion/');
		}
		else{
			alert("Error, usuario no encontrado");
		}
	});
}

