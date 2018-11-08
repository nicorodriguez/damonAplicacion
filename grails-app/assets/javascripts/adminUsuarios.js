function editarUsuario(){

    var email
    var servicio
    var estado
    var tipo

    email=$("#email").text()
    servicio=$(".servicio:selected").val();
    estado=$(".estado:selected").val();
    tipo=$(".tipo:selected").val();

    var datos = { 
        email: email,
        servicio: servicio,
        tipo: tipo,
        estado: estado 
    };
    
    $.post( "/damonAplicacion/calendar/editarUsuario", datos).done(function( resp ){
        console.log(resp);
        if(resp == "true"){
            alert("Datos cambiados satisfactoriamente");
            window.location.reload();
            //$(location).attr('href', 'http://localhost:8080/damonAplicacion/adminview/busquedaUsuario?parametro=' + email.replace("@", "%40") + '&buscar=Buscar');
            //$(location).attr('href', 'http://localhost:8080/damonAplicacion/adminview/adminUsuario');
        }
        else{
            alert("Datos no cambiados");
        }
    });
}

function resetCreditos(){   
    var email=$("#email").text()

    var datos={
        email:email
    }

    $.post( "/damonAplicacion/calendar/resetearCreds",datos).done(function( resp ){
        console.log(resp);
        if(resp == "true"){
            alert("Creditos Reeteados satisfactoriamente");
            window.location.reload();
        }
        else{
            alert("Creditos no Reseteados.");
            window.location.reload();
        }
    });
}