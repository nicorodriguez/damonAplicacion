function crearServicio(){

    var nombre=$("#nombre").val()
    var creditos=$("#creditos").val()

    var datos = { 
        nomb: nombre,
        creditos:creditos
    };
    $.post( "/damonAplicacion/adminview/crearServ", datos).done(function( resp ){
        console.log(resp);
        if(resp == "true"){
            alert("Servicio creado satisfactoriamente.");
             window.location.reload();
        }
        else{
            if (resp=="yacreado") {
            alert("Servicio ya creado.");
        }
        else{
            alert("Hubo un inconveniente y no se creo el servicio.");
        }
        }

    });
}

function crearCategoria(){

    var nombre=$("#nombre");

    var datos = { 
        nomb: nombre
    };
    $.post( "/damonAplicacion/adminview/crearTipo", datos).done(function( resp ){
        console.log(resp);
        if(resp == "true"){
            alert("Categoria creada satisfactoriamente.");
             window.location.reload();
        }
        else{
            if (resp=="yacreado") {
            alert("Categoria ya creada.");
        }
        else{
            alert("Hubo un inconveniente y no se creo la Categoria.");
        }
        }

    });
}