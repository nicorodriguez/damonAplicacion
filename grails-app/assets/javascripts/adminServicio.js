function crearServicio(){

    var nombre=$("#nombreServicio").val()
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

function eliminarServicio(){
    var nomb=$(".nomServ").val()

    var datos = {
        nomb:nomb
    }

    $.post( "/damonAplicacion/adminview/eliminarServ", datos).done(function( resp ){
        console.log(resp);
        if(resp == "true"){
            alert("Categoria eliminada satisfactoriamente.");
             window.location.reload();
        }
        else{
            if (resp=="inexitente") {
            alert("Categoria no existente.");
        }
        else{
            alert("Hubo un inconveniente y no se elimino la Categoria.");
        }
        }

    });
}

function crearCategoria(){

    var nombre=$("#nombreCat").val();

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

function eliminarC(){

    var nombre=$("#nombCat").val();

    var datos = { 
        nomb: nombre
    };
    $.post( "/damonAplicacion/adminview/eliminarTipo", datos).done(function( resp ){
        console.log(resp);
        if(resp == "true"){
            alert("Categoria eliminada satisfactoriamente.");
             window.location.reload();
        }
        else{
            if (resp=="inexitente") {
            alert("Categoria inexitente.");
        }
        else{
            alert("Hubo un inconveniente y no se eliminó la Categoria.");
        }
        }

    });
}