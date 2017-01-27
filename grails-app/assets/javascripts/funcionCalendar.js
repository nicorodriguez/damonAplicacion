
$(document).ready(function(){
    
        diahora= "Anotado " + dia + " " + hora + "hs";
        $("#anotado li").first().append("<li>" + diahora + " " + '<a onclick="anotarse("${clase.tipo.nombre}","${clase.getFecha()}","${clase.getHora()}")><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>' + "</li>");

        /* Funcion para que inhabilite el evento click de los dias y los horarios*/
        

    }); 
       
    /*Sacamos evento onclick*/    
    $(".semana").children().unbind("click");
    $(".horarios").unbind("click");



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
function anotarse(tipousuario,fecha,hora){
    var td
    var dia;
    var primero;
    var ptr;
    var hora;

    
    td= $(event.target)
    td.css('color','#FFFFFF')
    
    posicion= td.eq()
    dia=$('#dias').eq(posicion).text(); 
    hora=td.parent().children('td').first().text()
    diahora= "Anotado " + dia + " " + hora + "hs"
    $("#anotado li").first().append("<li>" + diahora + " " + '<a onclick="anotarse("${clase.tipo.nombre}","${clase.getFecha()}","${clase.getHora()}")><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>' + "</li>");

        /*
        posicion=$(this).index();
        dia=$("#tbUsuario tr").first().children('td').eq(posicion).text(); // Trae dia //
        hora=$(this).parent().children('td').first().text(); // Trae hora //
        */
    
    alert("llegue")

 }
   
/* Lo comento temporalmente ya que no esta el metodo anotarse.
    var datos = {
        tipousuario: tipousuario,
        fecha:fecha,
        hora:hora
    }    
  $.post( "/damonAplicacion/calendar/anotarse", datos).done(function( resp ){
        console.log(resp);
        if(resp == "true"){
            alert("Anotado satisfactoriamente");
            $(location).attr('href', 'http://localhost:8080/damonAplicacion/calendar');
        }
        else{
            alert("Hubo un inconveniente, no pudo anotarse");
        }
    });

}
*/
/*
function prepararDatos(){

    horario=$("#horario").val();
    fecha1=$("#fecha").val();
    fecha= fecha1 + " " + horario

    anotarse(horario,fecha1)

}


function anotarse(horario,fecha){
    var datos = {
        horario: horario,
        fecha: fecha
    };
  $.post( "/damonAplicacion/calendar/anotarse", datos).done(function( resp ){
    console.log(resp);
    if(resp == "true"){
        alert("Se anoto correctamente");
        $(location).attr('href', 'http://localhost:8080/damonAplicacion/calendar');
    }
    else{
        alert("Hubo un inconveniente al querer anotarse, intentelo nuevamente.");
    }
});

}

function prepararDatos(){

    horario=$("#horario").val();
    fecha1=$("#fecha").val();
    fecha= fecha1 + " " + horario

    desanotarse(horario,fecha1)

}

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
