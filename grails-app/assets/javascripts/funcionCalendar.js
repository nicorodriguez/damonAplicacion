var msj ="";

var x;
x=$(document);
x.ready(inicializarEventosRegistro);

function inicializarEventosRegistro()
{
    $("#error").hide();
	$("#confirmar").hide();
}

function crearClase() {
    var dia;
    var horario;
    var profesor;
    var fecha;
    var tipo;
    var cantidad;

    horario=$("#horario").val();
    profesor=$("#profesor").val();
    tipo=$("#tipo").val();
    fecha1=$("#fecha").val();
    fecha= fecha1 + " " + horario
    cantidad=$("#cant").val();

    envioDatos(profesor,tipo,fecha,cantidad);  
}

function envioDatos(profesor,tipo,fecha,cantidad){

    var datos = { 
        profe: profesor,
        tipous: tipo,
        fecha: fecha,
        cantmax: cantidad
    };
    $.post( "/damonAplicacion/calendar/crearClase", datos).done(function( resp ){
        console.log(resp);
        if(resp == "true"){
            msj = "Clase creada satisfactoriamente.";
            setTimeout("showConfirm(msj)",5000);
            //alert("Clase creada satisfactoriamente.");
             window.location.reload();
        }
        else{
            msj = "Clase no creada";
            setTimeout("showError()",5000);   
            alert("Clase no creada");
        }
    });
}

function anotarse(tipoclase,fecha,hora){
    var td
    var tr

    // Cambio el color de la letra (despues tengo que pintar la celda.)
    td= $(event.target)
    td.css('color', '#FFFFFF')
    td.parent().css('background-color','#337ab7');


    fechahor= fecha + " " + hora;
   
    var datos = {
        tipoclase: tipoclase,
        fechahor: fechahor
    }

        $.post( "/damonAplicacion/calendar/anotarseClase", datos).done(function( resp ){
        console.log(resp);
        if(resp == "true"){
            msj = "Anotado satisfactoriamente.";
            //alert("Anotado satisfactoriamente.");
            //Esto redirige a algun lado, no usar para la recarga de la pagina.
            //$(location).attr('href', 'http://localhost:8080/damonAplicacion/calendar');
            
            window.location.reload();
        }else if (resp == "creditos"){
            msj = "Creditos insuficientes.";
            //alert("Creditos insuficientes.");
            window.location.reload();
        }else if (resp == "lleno"){
            msj = "Creditos insuficientes.";
            //alert("La clase se encuentra lleno.");
            window.location.reload();
        }else if (resp == "yaanotado"){
            msj =  "Ya te encuentras anotado a dicha clase.";          
            //alert("Ya te encuentras anotado a dicha clase.");
            window.location.reload();
        }else if (resp == "tarde"){
            msj = "Ya es tarde para anotarse a dicha clase.";
            //alert("Ya es tarde para anotarse a dicha clase.");
            window.location.reload();
        }
        else{
            msj = "Hubo un inconveniente, no pudo anotarse";
            //alert("Hubo un inconveniente, no pudo anotarse");
            window.location.reload();
        }
    });
 }

 function desanotarse(tipoclase,fecha,hora){
    console.log(tipoclase)
    console.log(fecha)
    console.log(hora)

    fechahor= fecha + " " + hora;
    
      var datos = {
        tipoclase: tipoclase,
        fechahor: fechahor
    }

        $.post( "/damonAplicacion/calendar/desanotarseClase", datos).done(function( resp ){
        console.log(resp);
        if(resp == "true"){
            alert("Desanotado satisfactoriamente");
            window.location.reload();
            // $(location).attr('href', 'http://localhost:8080/damonAplicacion/calendar')
        }
        else{
            alert("No pudo desanotarse, se produjo algun error.");
            window.location.reload();
        }
    });

 }

 function eliminarClase(){

    var datos
    datos = $("#elimClase").val();

    var parametros = {
        id:datos
    }

    $.post( "/damonAplicacion/calendar/eliminarClase", parametros).done(function( resp ){
        console.log(resp);
        if(resp == "true"){
            alert("Clase eliminada satisfactoriamente");
            window.location.reload();
            // $(location).attr('href', 'http://localhost:8080/damonAplicacion/');
        }
        else{
            if (resp == "inexistente"){
                alert("La clase que quiere eliminar no existe");
                window.location.reload();
            }
            else{
                alert("Error Inesperado");
                window.location.reload();
            }
        }
    });
    
}

    /*

    posicion= td.parents()
    dia=$('#dias').eq(posicion).text(); 
    hora=td.parent().children('td').first().text()
    diahora= "Anotado " + dia + " " + hora + "hs"
    $("#anotado li").first().append("<li>" + diahora + " " + '<a onclick="anotarse("${clase.tipo.nombre}","${clase.getFecha()}","${clase.getHora()}")><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>' + "</li>");

    */


/*
function desanotarse(horario,fecha){
    var datos = {
        horario: horario,
        fecha: fecha
    };
  $.post( "/damonAplicacion/calendar/desanotarse", datos).done(function( resp ){
    console.log(resp);
    if(resp == "true"){
        alert("Se anoto correctamente");
        $(location).attr('href', 'http://localhost:8080/damonAplicacion/calendar');
    }
    else{
        alert("Hubo un inconveniente al querer desanotarse, intentelo nuevamente.");
    }
});

}

*/
