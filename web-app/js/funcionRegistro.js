
var x;
x=$(document);
x.ready(inicializarEventosRegistro);

function inicializarEventosRegistro(){
	
	var x;
	x=$("#botonRegistrarse");
	x.click(checkname);

}

function checkname(){
	var nom;
	var ape;

	nom=$("#nombre").val();
	ape=$("#apel").val();
	nom=nom.length
	ape=ape.length

	if (apel!= 0 && nom!=0){
		checkemail();
	}
	else{
		$(".nom").addClass("has-error");
		return	false;	
	}
}


function checkemail(){
	var email;
	var remail;


	email=$("#email").val();
	remail=$("#remail").val();

	if (email == remail) {
	    //Cheque que los emails coincidan
	 	if (email.length=!0){ //Chequea que los emails no sean blanco
	 		checkPsw();    	//si los emails coinciden va a chequear las psw
	 	}
	 	else{  //uno de los dos quedo en blanco
	 		$(".correo").addClass("has-error");
	 		return false;	 		
	 	}
	}
	else{	//si los emails no coinciden, ingreso 2 diferentes.
		$(".correo").addClass("has-error");
		return false;
	}
}

function checkPsw(){
	var psw;
	var rpsw;

	psw=$("#psw").val();
	rpsw=$("#rpsw").val();
	if (psw.length > 6 && rpsw.length > 6) {   //Chequea que las password no las deje en blanco y que sea >6 nº de caracteres
		if (psw == rpsw){
		//alert("los emails y las psw coinciden")
			checkmodalidad();
	}
		else{ 
			$(".pass").addClass("has-error");
			return	false;  //Ingreso mal las passwords
		}
	}else{
		$(".pass").addClass("has-error");  //ingreso password menor que la cantidad establecida
		return false;
	}	
}

function checkmodalidad() {
	var modalidad;
	var email;
	var psw;
	var nombre;
	var apel;
	var modalidad;
	var sexo;

	email=$("#email").val();
	psw=$("#psw").val();
	nombre=$("#nombre").val();
	apel=$("#apel").val();
	modalidad=$("#modalidad").val();

		if (modalidad=="-- Seleccione --"){
			alert("Se debe seleccionar la modalidad");
			return false;
		}
		else{
			if (modalidad == "2 Veces por semana"){
                modalidad = "2VS";
            }
            else{
              	if (modalidad == "3 veces por semana"){
                    modalidad = "3VS";
                }
                else{
                    if(modalidad == "Pase libre"){
                        modalidad = "PL";
                    }
                    else{
                        alert("Modalidad Invalida");
                    }
                }
            }
			enviarJSON(email,psw,nombre,apel,modalidad);
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


/*
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
*/