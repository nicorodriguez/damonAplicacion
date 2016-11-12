var x;
x=$(document)
x.ready(inicializarEventosLogin);

function inicializarEventosLogin(){
	var x;
	x=$("#btnLogin");
	x.click();
}
function traeruserpsw(){
	var x;
	var y;
	x=$("#login-name").val();
	y=$("#login-pass").val();
	
	enviaJSON(x,y);
}

function enviaJSON(var1,var2){
	var parametros = {
			name: var1,
			time: var2
		};
	$.post( "/Damon2/controlador1", parametros);  //metodo index

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