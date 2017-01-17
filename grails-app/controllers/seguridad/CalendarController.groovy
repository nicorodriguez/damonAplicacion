package seguridad
import seguridad.Usuario
import seguridad.Rol
import seguridad.Servicio
import sistema.Clase
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession
import grails.transaction.Transactional
import session.SessionManager
import java.text.SimpleDateFormat

class CalendarController {

    def index() {
    	def smgr = new SessionManager(request.session)
    	def u = smgr.getCurrentUser()
    	if (u){
    		render(view: 'index')
    	}
    	else{
            redirect(controller: "login" , action:"index")
    		//redirect(url: "http://localhost:8080/damonAplicacion/")
    	}
	}

    def misDatos(){
        redirect(controller: "usuario" , action:"misDatos")
    }

    def formatHora(){
        
        Date fechaOriginal = new Date()
        println(fechaOriginal)

        def formatoNuevo = new SimpleDateFormat("EEEE")
        String fechaPosta = formatoNuevo.format(fechaOriginal)
        println(fechaPosta)

        def formatoNuevo2 = new SimpleDateFormat("EEEE - dd/MM/yyyy - hh:mm")
        String fechaPosta2 = formatoNuevo2.format(fechaOriginal)
        println(fechaPosta2)

        //Funciona para pasar un string a date, los parametros son: Date.parse(forma del string, variable string)
        //Date date = Date.parse( 'dd-MMM-yyyy', a )

        //Se define un formato para la fecha y luego de la formatea la fecha generada con dicho formato
        //Date fechaOriginal = new Date()
        //def formatoNuevo = new SimpleDateFormat("MM/dd/yyyy")
        //String fechaPosta = formatoNuevo.format(fechaOriginal)
        //NO OLVIDARSE DE AGREGAR ->    import java.text.SimpleDateFormat
    }



    def crearClase(){
        /*
        //Nota: traer los profesores disponibles del servidor con email y nombre, luego al crear la clase pasar sólo el email por parametro

        try{
            println("CrearClase - Voy a buscar los parametros")

            // Capturo datos de post de formulario
            String fecha = request.getParameter("fecha")
            String horario = request.getParameter("horario")
            String profeEmail = request.getParameter("profe")
            String tipoUsuario = request.getParameter("tipo")
            Integer maxCantidad = request.getParameter("cantmax")

            //Verificar las fechas en las funciones de javascript
            //Paso las fechas de strings a date
            Date fechaDate = Date.parse( 'EEEE - dd/MM/yyyy', fecha )
            Date horaDate = Date.parse( 'hh:mm', horario )

            //Traer los profesores de la base de datos verifica que existe
            Usuario prof = Usuario.findByEmail(profeEmail)

            //Traer los tipos de la base de datos verifica que existen
            Tipousuario tipo1 = Tipousuario.findByNombre(tipoUsuario)

            //Verifico que no existe una clase en ese dia, horario y con dicho tipo
            Clase class = Clase.findByFechaAndHorarioAndTipo(fechaDate,horaDate,tipo1)

            if (class){
                println("CrearClase - Clase ya creada en ese fecha, horario y con ese tipo")
                render("false")
            }
            else{
                Clase clasee = new Clase(fechaDate,horaDate,prof,tipo1,maxCantidad)
                clasee.inicializarTablaAnotados()
                clasee.save(flush: true)
                println(clasee)

                println("CrearClase - CLASE CREADA SATISFACTORIAMENTE")
                render("true")
            }
        }
        catch(Exception e){
            println("PROBLEMA")
            println(e)

            render ("false")
        }
        */
    }


    def anotarseClase(){
        /*
        try{
            println("AnotarseClase - Voy a buscar los parametros")

            // Capturo datos de post de formulario
            String fecha = request.getParameter("fecha")
            String horario = request.getParameter("horario")
            String usuarioEmail = request.getParameter("usuarioemail")
            String tipoClase = request.getParameter("tipoclase")

            //Verificar las fechas en las funciones de javascript
            //Paso las fechas de strings a date
            Date fechaDate = Date.parse( 'EEEE - dd/MM/yyyy', fecha )
            Date horaDate = Date.parse( 'hh:mm', horario )

            //Traigo los datos de la clase:
            Clase clasee = Clase.findByFechaAndHorarioAndTipo(fechaDate,horaDate,tipoClase)
            
            //Verifico que exista la clase
            if (!clasee){
                println("AnotarseClase - Clase inexistenete en esa fecha, horario y con ese tipo")
                render("false")
            }
            else{
                //Traer los datos del usuario:
                Usuario usuario = Usuario.findByEmail(usuarioEmail)

                //Traigo el tipo del usuario
                Tipousuario tipoUsuario = usuario.tipo

                //Comparo el tipo de usuario con el tipo de la clase
                if (tipoUsuario != tipoClase){
                    println("AnotarseClase - Tipo de clase y tipo de usuario no concuerdan!!")
                    render("false")
                }
                else{
                    println("AnotarseClase - Tipo de clase y tipo de usuario concuerdan -- Continuo")

                    //Verifico que haya lugar en la clase
                    if (!clasee.hayLugar()){
                        println("AnotarseClase - Clase llena")
                        println("Cantidad Actual: " + clasee.cantidadActual "= Cantidad Max: " + clasee.cantidadMax)
                        render("false")
                    }
                    else{
                        println("AnotarseClase - Clase con lugar disponible")
                        println("Cantidad Actual: " + clasee.cantidadActual "= Cantidad Max: " + clasee.cantidadMax)

                        Int cantAct = clasee.aumentarCapActual()
                        println("Nueva Cantidad Actual = " + cantAct)

                        //Agrego Usuario a la lista de anotados:
                        boolean resultado = clasee.agregarUsuarioALista(usuario)

                        if (!resultado){
                            println("AnotarseClase - No se pudo agregar a la lista")
                            render("false")
                        }
                        else{
                            println("AnotarseClase - SE AGREGO SATISFACTORIAMENTE")
                            render("true")
                        }
                    }
                }
            }
            
        }
        catch(Exception e){
            println("PROBLEMA")
            println(e)

            render ("false")
        }

        */
    }

}
