
$(document).ready(function(){
 	/*
    $("#tbUsuario tr").click(function(){
        $(this).css('background-color','black');
        $(this).css('color','white');
        $("#acciones").fadeIn('slow');
        var a = $(".td1:first").val();
        alert(a);
    });
    */
    $("#tbUsuario tr td").click(function(){       /* Esta es la funcion que hace que se pinte una celda*/
        var dia;
        var primero;
        var hora;

        /* Trae la celda seleccionada con un click y le cambia el fondo */

        $(this).css('background-color','#369');     
        $(this).css('color','white');
        
        /* Termina funcion que trae y pinta la celda */

        /* Funcion para traerme el dia y la hora de la tabla */

        posicion=$(this).index();
        dia=$("#tbUsuario tr").first().children('td').eq(posicion).text(); /* Trae dia */
        hora=$(this).parent().children('td').first().text(); /* Trae hora */
        
        $(this).disabled
        /*Termina funcion donde traigo el dia y la hora */


        diahora= "Anotado dia " + dia + " " + "Hora: " + hora
        $("#anotado li").first().append("<li>" + diahora + "</li>")



    });

    /*
    $("#tbUsuario tr td").mouseleave(function(){
        $(this).css('background-color','#F4F4F4');
        $(this).css('color','#333');
        evento mouse leave cuando el usuario saca el mousse
    });
 */
})


