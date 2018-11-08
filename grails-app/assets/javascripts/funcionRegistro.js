
var x;
x=$(document);
x.ready(inicializarEventosRegistro);

function inicializarEventosRegistro(){
	
	var x;
	x=$("#botonRegistrarse");
	$("#error").hide();
	$("#confirmar").hide();
	x.click(checkname);
	quitarPendiente();
}

function quitarPendiente()
{
    // Aca podemos quitar todas las 
    $("#modalidad option[value='Pendiente']").remove();
}


function checkname(){
	var nom;
	var ape;

	nom=$("#nombre").val();
	ape=$("#apel").val();
	nom=nom.length
	ape=ape.length

	if ((ape > 2) && (nom > 2))
	{ // Email ok.
		if( (ape < 17) && (nom < 17))
		{
			checkemail();
		}
		else
		{
			windows.setTimeout(mostrarMensaje("No debe superar el maximo requerido"),5000)
			//inicializarEventosRegistro(); 
		}
	}
	else{
		windows.setTimeout(mostrarMensaje("Debe superar el minimo requerido",'E'),5000) // Error en el correo.
		//inicializarEventosRegistro();
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
	if ((psw.length > 5) && (rpsw.length > 5) && (psw.length < 19) && (rpsw.length < 19)) {   //Chequea que las password no las deje en blanco y que sea >6 nº de caracteres
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

			alert("Usuario creado Satisfactoriamente!");
			
			$("#errorText").innerHTML = "Email en uso, por favor ingrese otro";				
			$("#error").show();
			// $("#errorText").innerHTML = "Usuario creado Satisfactoriamente!";				
			// $("#error").show();
				
			$(location).attr('href', 'http://localhost:8080/damonAplicacion/');
			// return false;
		}
		else{
			if (resp == "existe"){
<<<<<<< HEAD
				//alert("Email en uso, por favor ingrese otro");
				windows.setTimeout(mostrarMensaje("Email en uso, por favor ingrese otro",'E'),5000);				
				
=======

				alert("Email en uso, por favor ingrese otro");
				
				// $("#errorText").innerHTML = "Email en uso, por favor ingrese otro";				
				// $("#error").show();
				// return false;
>>>>>>> bdc26f5256d3da2064fe6c89a89501d0b9494765
			}
			else{ //Aca en teoria anduvo. 
				$("#errorText").innerHTML = "Email en uso, por favor ingrese otro";				
				$("#error").show();				
			else{ //Aca en teoria anduvo.

				alert("Ocurrió un error al crear el usuario!!");

				// $("#errorText").innerHTML = "Ocurrió un error al crear el usuario!!";				
				// $("#error").show();				
			}
		}
	});
	
}

function mostrarMensaje(mensaje,tipo)
{   
    if(tipo == 'C') // Es un mensaje de confirmación
    {   
        $("#confirmText").text(mensaje);
        $("#confirmar").show();
    }
    else if(tipo == 'E')//Error 
    {
        $("#errorText").text(mensaje);
        $("#error").show();
    }
}

//window.location.replace(...)

