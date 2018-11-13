var msj ="";

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
            windows.setTimeout(mostrarMensaje("Clase creada satisfactoriamente.",'C'),5000);
        }
        else{
           
            windows.setTimeout(mostrarMensaje('Clase no creada','E'),5000)   
            
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
            windows.setTimeout(mostrarMensaje("Anotado satisfactoriamente.",'C'),5000);
            inicializarEventosRegistro();
            //$(location).attr('href', 'http://localhost:8080/damonAplicacion/calendar');
            window.location.reload();
        }else if (resp == "creditos"){
            windows.setTimeout(mostrarMensaje("Creditos insuficientes.",'E'),5000;
            inicializarEventosRegistro();

        }else if (resp == "lleno"){
            windows.setTimeout(mostrarMensaje("La clase se encuentra lleno.",'E'),5000);
            inicializarEventosRegistro();
        }else if (resp == "yaanotado"){
            windows.setTimeout(mostrarMensaje("Ya te encuentras anotado a dicha clase.",'E'),5000);
            inicializarEventosRegistro();
        }else if (resp == "tarde"){
            windows.setTimeout(mostrarMensaje("Ya es tarde para anotarse a dicha clase.",'E'),5000);
            inicializarEventosRegistro();
        }
        else{
            windows.setTimeout(mostrarMensaje("Hubo un inconveniente, no pudo anotarse",'E'),5000);
            inicializarEventosRegistro();
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
            windows.setTimeout(mostrarMensaje("Desanotado satisfactoriamente",'C'),5000);
            inicializarEventosRegistro();
            // $(location).attr('href', 'http://localhost:8080/damonAplicacion/calendar')
        }
        else{
            windows.setTimeout(mostrarMensaje("No pudo desanotarse, se produjo algun error.",'E'),5000);
            inicializarEventosRegistro();
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
            windwos.setTimeout(mostrarMensaje("Clase eliminada satisfactoriamente",'C'),5000);
            inicializarEventosRegistro();
            // $(location).attr('href', 'http://localhost:8080/damonAplicacion/');
        }
        else{
            if (resp == "inexistente"){

                windows.setTimeout(mostrarMensaje("La clase que quiere eliminar no existe",'E'),5000);
                inicializarEventosRegistro();
            }
            else{
                windows.setTimeout(mostrarMensaje("Error Inesperado",'E'),5000);
                inicializarEventosRegistro();
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
