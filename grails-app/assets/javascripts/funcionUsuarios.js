function enviaJSON(email1,servicio,tipo,estado){
	var parametros = {
			email: email1,
			servicio: servicio,
			tipo: tipo,
			estado: estado

		};

		// Cuales son las posibles respuesas par el post.

	$.post( "/damonAplicacion/calendar/ediarUsuario", datos).done(function( resp ){
        console.log(resp);
        if(resp == "true"){
            alert("");
             window.location.reload();
        }
        else{
        	if  {
            alert("Clase no creada");
        		}
        }
    });

}