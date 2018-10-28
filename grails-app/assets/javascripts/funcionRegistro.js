
var x;
x=$(document);
x.ready(inicializarEventosRegistro);

function inicializarEventosRegistro(){
	
	var x;
	x=$("#botonRegistrarse");
	$("#error").hide();
	$("#confirmar").hide();
	x.click(checkname);

}

function checkname(){
	var nom;
	var ape;

	nom=$("#nombre").val();
	ape=$("#apel").val();
	nom=nom.length
	ape=ape.length

	if ((ape != 0) && (nom !=0)){ // Email ok.
		checkemail();
	}
	else{
		$('#error').show() // Error en el correo.
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
			 $('#error').show()
	 	}
	}
	else{	//si los emails no coinciden, ingreso 2 diferentes.
		$('#error').show()
		}
}

function checkPsw(){
	var psw;
	var rpsw;

	psw=$("#psw").val();
	rpsw=$("#rpsw").val();
	if ((psw.length > 5) && (rpsw.length > 5)) {   //Chequea que las password no las deje en blanco y que sea >6 nº de caracteres
		if (psw == rpsw){
		//alert("los emails y las psw coinciden")
			checkmodalidad();
		}
		else{ 
			$("#error").show();
		}
	}
	else{
		$('#error').show()
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
	sexo=$(".sexo:checked").val();
	console.log(modalidad);

	// ACa tengo que crear el parse para pasarle a Nico una sola letra. 
	
		if (modalidad=="0"){
			alert("Se debe seleccionar la modalidad");
			return false;
		}
		else{
			enviarJSON(email,psw,nombre,apel,modalidad,sexo);
		}
}

function enviarJSON(email,psw,nombre,apel,modalidad,sexo){
	var parametros = {
		email: email,
		password: psw,
		nomb: nombre,
		apell: apel,
		modal: modalidad,
		sex: sexo
	};
	$.post( "/damonAplicacion/registro/crearUsuario", parametros).done(function( resp ){
		console.log(resp);
		if(resp == "true"){

			
			$("#errorText").innerHTML = "Email en uso, por favor ingrese otro";				
			$("#error").show();
				
			$(location).attr('href', 'http://localhost:8080/damonAplicacion/');
			return false;
		}
		else{
			if (resp == "existe"){
				//alert("Email en uso, por favor ingrese otro");
				$("#errorText").innerHTML = "Email en uso, por favor ingrese otro";				
				$("#error").show();
				return false;
			}
			else{ //Aca en teoria anduvo. 
				$("#errorText").innerHTML = "Email en uso, por favor ingrese otro";				
				$("#error").show();				
			}
		}
	});
	
}

//window.location.replace(...)

