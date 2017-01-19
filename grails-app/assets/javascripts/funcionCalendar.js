
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
    /* Esta es la funcion que hace que se pinte una celda*/
        
    $("#tbUsuario tr td").one("click",function() {
        var dia;
        var primero;
        var hora;
        var ptr

        /* Trae la celda seleccionada con un click y le cambia el fondo */
        $(this).css('background-color','#369');
        $(this).css('color','white');
        
        posicion=$(this).index();
        dia=$("#tbUsuario tr").first().children('td').eq(posicion).text(); /* Trae dia */
        hora=$(this).parent().children('td').first().text(); /* Trae hora */
        
        $(this).disabled
        diahora= "Anotado " + dia + " " + hora + "hs"
        $("#anotado li").first().append("<li>" + diahora + "</li>")

        /* Funcion para que inhabilite el evento click de los dias y los horarios*/
        

    }); 
       
    /*Sacamos evento onclick*/    
    $(".semana").children().unbind("click");
    $(".horarios").unbind("click")

    });

function crearClase() {
    var dia,horario,profesor,fecha,tipo

    dia=$("#dias").val()
    horario=$("14:00") //Falta esto,a discutir con Nico.
    profesor=$("#profesor").val()
    tipo=$("#tipo").val()
    fecha=$("#fecha").val()

    envioDatos(dia,horario,profesor,tipo,fecha);  
}

function envioDatos(dia,horario,profesor,tipo,fecha){
    var datos = {
        dia: dia,
        horario: horario,
        profe: profesor,
        tipous: tipo,
        fecha: fecha
    };
    $.post( "/damonAplicacion/calendar/crearClase", parametros).done(function( resp ){
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


