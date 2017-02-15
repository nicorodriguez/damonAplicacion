    $(".js-number").bind('keydown', function(e){
       var targetValue = $(this).val();
       if (e.which ===8 || e.which === 13 || e.which === 37 || e.which === 39 || e.which === 46) { return; }

       if ((e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode >= 96 && e.keyCode <= 105)&& targetValue.length < 3)  {
          var c = String.fromCharCode(e.which);
          var val = parseInt(c);
          var textVal = parseInt(targetValue || "0");
          var result = textVal + val;

          if (result < 0 || result > 99) {
             e.preventDefault();
          }

          if (targetValue === "0") {
            $(this).val(val);
            e.preventDefault();
          }
       }
       else {
           e.preventDefault();
       }
    });

    var x
    x=$(document)
    x.ready(ocultocosas);


    function ocultocosas(){
      
      $(".ocultar").hide()

    }


    function cambPsw(){

      var apsw,psw,npsw

      apsw=$("#apsw").val()
      psw=$("#psw").val()
      npsw=$("#rpsw").val()
      if(psw == npsw){
        envioPsw(apsw,psw)
      }
      else{
          $(".ocultar").show()
      }

    }

    function envioPsw(apsw,psw){

    var datos = {

      contraseniav:apsw,
      contrasenian:psw,

    };
    $.post( "/damonAplicacion/calendar/cambiarContrasenia", datos).done(function( resp ){
        console.log(resp);
        if(resp == "true"){
            alert("Password Cambiada satisfactoriamente.");
             window.location.reload();
        }
        else{
          if(resp == "nocoincide"){
            $(".ocultar").show()
          }
          else{
            $(".ocultar").show()
          }
        }
    });
}

  function envioNombre(){
    var nom

    nom=$("#nom").text()

    var datos ={
      nombre:nom
    }
        $.post( "/damonAplicacion/calendar/cambiarNombre", datos).done(function( resp ){
        console.log(resp);
        if(resp == "true"){
            alert("Nombre cambiado satisfactoriamente.");
             window.location.reload();
        }
        else{
            $(".ocultar").show()
        }
    });
  }

function envioApe(){
    var ape

    ape=$("#ape").text()

    var datos ={
      apellido:ape
    }
        $.post( "/damonAplicacion/calendar/cambiarApellido", datos).done(function( resp ){
        console.log(resp);
        if(resp == "true"){
            alert("Apellido cambiado satisfactoriamente.");
             window.location.reload();
        }
        else{
            $(".ocultar").show()
        }
    });
  }