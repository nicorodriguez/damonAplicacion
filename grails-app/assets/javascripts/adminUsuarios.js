function envioDatos(){

    var email,servicio
    var estado, tipo

    email=$("#email").val()
    servicio=$("#servicio:selected").val()
    estado=$("#estado:selected").val();
    tipo=$("#tipo").val();

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

    $.post( "/damonAplicacion/calendar/resetearCreds", datos).done(function( resp ){
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