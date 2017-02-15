function cambiarRol(){   
    var email=$("#emailPC").text()
    var rol=$(".rol:selected").text()

    var datos = {
        rol:rol,
        email:email
    }

    $.post( "/damonAplicacion/calendar/cambiarRol", datos).done(function( resp ){
        console.log(resp);
        if(resp == "true"){
            alert("Rol cambiado satisfactoriamente.");
             window.location.reload();
        }
        else{
            alert("Rol No cambiado.");
            window.location.reload();
        }
    });
}