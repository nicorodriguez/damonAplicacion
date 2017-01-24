
$(document).ready(function(){
    /* Esta es la funcion que hace que se pinte una celda*/
        
    $("#tbUsuario tr td").one("click",function() {
        var dia;
        var primero;
        var hora;
        var ptr;

        /* Trae la celda seleccionada con un click y le cambia el fondo */
        $(this).css('background-color','#369');
        $(this).css('color','white');
        
        posicion=$(this).index();
        dia=$("#tbUsuario tr").first().children('td').eq(posicion).text(); /* Trae dia */
        hora=$(this).parent().children('td').first().text(); /* Trae hora */
        
        $(this).disabled;
        // $(this).datepicker($.datepicker.regional['es']);
        diahora= "Anotado " + dia + " " + hora + "hs";
        $("#anotado li").first().append("<li>" + diahora + " " +  '<button type="button" class="desanotarme"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></button>' + "</li>");

        /* Funcion para que inhabilite el evento click de los dias y los horarios*/
        

    }); 
       
    /*Sacamos evento onclick*/    
    $(".semana").children().unbind("click");
    $(".horarios").unbind("click");

    });

function crearClase() {
    var dia;
    var horario;
    var profesor;
    var fecha;
    var tipo;
    var cantidad;

    dia=$("#dias").val();
    horario=$("#horario").val();
    profesor=$("#profesor").val();
    tipo=$("#tipo").val();
    fecha=$("#fecha").val();
    cantidad=$("#cant").val();

    envioDatos(dia,horario,profesor,tipo,fecha,cantidad);  
}

function envioDatos(dia,horario,profesor,tipo,fecha,cantidad){
    var datos = {
        dia: dia,  
        horario: horario,
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


