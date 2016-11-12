var x;
x=$(document);
x.ready(inicializarEventosRegistro);

function inicializarEventosRegistro(){
	
	var x;
	x=$("#botonRegistrarse");
	x.click(checkEmail);

}

function checkEmail(){
	var email;
	var psw;
	var nombre;
	var apel;
	var modalidad;
	var sexo;
	var nombreyapel;

	email=$("#email").val();
	remail=$("#remail").val();
	

	nombreyapel=nombre +" " +apel;

	if (email == remail) {
	 	//alert("los emails coinciden");
	 	checkPsw();
	}else{
		//alert("los emails no coinciden");
	}
}

function checkPsw(){
	var x;
	var y;
	var z;

	email=$("#email").val();
	psw=$("#psw").val();
	nombre=$("#nombre").val();
	apel=$("#apel").val();
	modalidad=$("#modalidad").val();

	x=$("#psw").val();
	y=$("#rpsw").val();
	z=$("#email").val();

	if (x == y){
		//alert("los emails y las psw coinciden");
		enviarJSON(email,psw,nombre,apel,modalidad);
	}else{
		$("#pasw").addClass("has-error");
		$("#repasw").addClass("has-error");
	}
}

function enviarJSON(email,psw,nombre,apel,modalidad){
	var parametros = {
		email: email,
		password: psw,
		nomb: nombre,
		apell: apel,
		modal: modalidad
	};
	$.post( "/damonAplicacion/registro/crearUsuario", parametros);
}