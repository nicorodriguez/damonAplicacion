function editarUsuario(){

    var email,servicio
    var estado, tipo

    email=$("#email").text()
    servicio=$(".servicio:selected").text()
    estado=$(".estado:selected").val();
    tipo=$("#tipo").text();

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
        }
        else{
            alert("Datos no cambiados");
            window.location.reload();
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