/*var x;
x=$(document)
x.ready(inicializarEventosLogin);

function inicializarEventosLogin(){
	var x;
	x=$("td");
	x.click(pintarTabla(this));
}
function pintarTabla(this){
	this.css("background-color","#9775AA")
}

 */

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
        $(this).css('background-color','#369');
        $(this).css('color','white');
        posicion=$(this).index()
        alert(posicion)
    });
    $("#tbUsuario tr td").mouseleave(function(){
        $(this).css('background-color','#F4F4F4');
        $(this).css('color','#333');
    });
 
})
/*
$(document).ready(function(){
    $("td").click(function(){
	var idi = $(this).val();
        alert('Evento click '+ idi);
    });
});
*/