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
            alert("Clase creada satisfactoriamente");
            $(location).attr('href', 'http://localhost:8080/damonAplicacion/calendar');
        }
        else{
            alert("Clase no creada");
        }
    });
}

function anotarse(tipoclase,fecha,hora){
    var td
    var tr

    // Cambio el color de la letra (despues tengo que pintar la celda.)
    td= $(event.target)
    td.css('background-color','#555555');

    fechahor= fecha + " " + hora;
   
    var datos = {
        tipoclase: tipoclase,
        fechahor: fechahor
    }

        $.post( "/damonAplicacion/calendar/anotarseClase", datos).done(function( resp ){
        console.log(resp);
        if(resp == "true"){
            alert("Anotado satisfactoriamente");
            $(location).attr('href', 'http://localhost:8080/damonAplicacion/calendar');
        }else if (resp == "creditos"){
            alert("Creditos insuficientes");
        }else if (resp == "lleno"){
            alert("La clase se encuentra lleno")
        }
        else{
            alert("Hubo un inconveniente, no pudo anotarse");
        }
    });
 }

 function desanotarse(tipoclase,fecha,hora){
    console.log(tipoclase)
    console.log(fecha)
    console.log(hora)
    
    /* Recordar Descomentar cuando ande lo demas.
      var datos = {
        tipoclase: tipoclase,
        fechahor: fechahor
    }

        $.post( "/damonAplicacion/calendar/anotarseClase", datos).done(function( resp ){
        console.log(resp);
        if(resp == "true"){
            alert("Desanotado satisfactoriamente");
            $(location).attr('href', 'http://localhost:8080/damonAplicacion/calendar')
        }
        else{
            alert("No pudo desanotarse, se produjo algun error.");
        }
    });
    */

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
