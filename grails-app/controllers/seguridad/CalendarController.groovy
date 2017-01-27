package seguridad
import seguridad.Usuario
import seguridad.Rol
import seguridad.Servicio
import sistema.Clase
import sistema.Tipousuario
import sistema.Establecimiento
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


    @Transactional
    def crearClase(){
        
        //Nota: traer los profesores disponibles del servidor con email y nombre, luego al crear la clase pasar sólo el email por parametro

        try{
            println("CrearClase - Voy a buscar los parametros")

            // Capturo datos de post de formulario
            String fecha = request.getParameter("fecha")
            String profeEmail = request.getParameter("profe")
            String tipoUsuario = request.getParameter("tipous")
            String cantString = request.getParameter("cantmax")
            
            println("Recibi los parametros: -> "+fecha+", "+profeEmail+", "+tipoUsuario)
            println("FECHA: "+fecha)
            println("PROFESOR: "+profeEmail)
            println("TIPO USUARIO: "+tipoUsuario)
            println("CANT MAX: "+cantString)

            Integer maxCantidad = cantString.toInteger()
            println("Cant Max: "+maxCantidad)
            //Verificar las fechas en las funciones de javascript
            //Paso las fechas de strings a date
            println("CrearClase - Voy a parsear la date")
            Date fechaDate = Date.parse( 'EEEE dd/MM/yyyy hh:mm', fecha )

            println("CrearClase -> "+fechaDate)

            //Traer los profesores de la base de datos verifica que existe
            println("CrearClase - Voy a buscar el Profesor")
            Usuario prof = Usuario.findByEmail(profeEmail)

            //Traer los tipos de la base de datos verifica que existen
            println("CrearClase - Voy a buscar el Tipo de Usuario")
            Tipousuario tipo1 = Tipousuario.findByNombre(tipoUsuario)

            //Verifico que no existe una clase en ese dia, horario y con dicho tipo
            println("CrearClase - Voy a ver si existe una clase igual")
            Clase clasevieja = Clase.findByFechaHorarioAndTipo(fechaDate,tipo1)

            if (clasevieja){
                println("CrearClase - Clase ya creada en ese fecha, horario y con ese tipo")
                render("false")
            }
            else{
                Clase clasee = new Clase(fechaDate,prof,tipo1,maxCantidad)

                // Clase clasee = new Clase(fechaDate,prof,tipo1,maxCantidad)
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
        
    }

    
    def anotarseClase(){
        
        try{
            println("AnotarseClase - Voy a buscar los parametros")

            // Capturo datos de post de formulario
            String fecha = request.getParameter("fechahor")
            String tipoClase = request.getParameter("tipoclase")

            println("Recibi los parametros: -> "+fecha+", "+tipoClase)

            //Verificar las fechas en las funciones de javascript
            //Paso las fechas de strings a date
            println("CrearClase - Voy a parsear la date")
            Date fechaDate = Date.parse( 'dd/MM/yyyy hh:mm', fecha )

            //Traigo los datos de la clase:
            Clase clasee = Clase.findByFechaAndHorarioAndTipo(fechaDate,tipoClase)
            
            //Verifico que exista la clase
            if (!clasee){
                println("AnotarseClase - Clase inexistenete en esa fecha, horario y con ese tipo")
                render("false")
            }
            else{
                //Traer los datos del usuario:
                def smgr = new SessionManager(request.session)
                Usuario usuario = smgr.getCurrentUser()

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
                        println("Cantidad Actual: " + clasee.cantidadActual +"= Cantidad Max: " + clasee.cantidadMax)
                        render("lleno")
                    }
                    else{
                        println("AnotarseClase - Clase con lugar disponible")
                        println("Cantidad Actual: " + clasee.cantidadActual +"= Cantidad Max: " + clasee.cantidadMax)

                        boolean resultadoCreditos = usuario.hayCreditos()

                        if (resultadoCreditos){
                            Integer cantAct = clasee.aumentarCapActual()

                            println("Nueva Cantidad Actual de Clase = " + cantAct)

                            Boolean resuCreditos = usuario.disminuirCreditos()

                            if (resuCreditos){
                                println("Nueva Cantidad de Creditos Actual = " + usuario.creditosActuales)
                                
                                //Agrego Usuario a la lista de anotados:
                                boolean resultadoFinal = clasee.agregarUsuarioALista(usuario)
                                                    
                                if (!resultadoFinal){
                                    println("AnotarseClase - No se pudo agregar a la lista")
                                    render("false")
                                }
                                else{
                                    println("AnotarseClase - SE AGREGO SATISFACTORIAMENTE")
                                    render("true")
                                }
                            }
                            else{
                                println("AnotarseClase - No se pudo disminuir los creditos")
                                render("false")
                            }
                        }
                        else{
                            println("AnotarseClase - No se anoto al usuario porque no tiene creditos")
                            render("creditos")
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

        
    }

    def desanotarseClase(){

        try{

            println("DesanotarseClase - Voy a buscar los parametros")

            // Capturo datos de post de formulario
            String fecha = request.getParameter("fechahor")
            String tipoClase = request.getParameter("tipoclase")

            println("Recibi los parametros: -> "+fecha+", "+tipoClase)


            //Verificar las fechas en las funciones de javascript
            //Paso las fechas de strings a date
            println("CrearClase - Voy a parsear la date")
            Date fechaDate = Date.parse( 'dd/MM/yyyy hh:mm', fecha )

            //Traigo los datos de la clase:
            Clase clasee = Clase.findByFechaAndHorarioAndTipo(fechaDate,tipoClase)
            
            //Verifico que exista la clase
            if (!clasee){
                println("DesanotarseClase - Clase inexistenete en esa fecha, horario y con ese tipo")
                render("false")
            }
            else{
               //Traer los datos del usuario:
                def smgr = new SessionManager(request.session)
                Usuario usuario = smgr.getCurrentUser()

                //Traigo el tipo del usuario
                Tipousuario tipoUsuario = usuario.tipo

                //Comparo el tipo de usuario con el tipo de la clase
                if (tipoUsuario != tipoClase){
                    println("DesanotarseClase - Tipo de clase y tipo de usuario no concuerdan!!")
                    render("false")
                }
                else{
                    println("DesanotarseClase - Tipo de clase y tipo de usuario concuerdan -- Continuo")

                    println("DesanotarseClase - Clase con lugar disponible")
                    println("Cantidad Actual: " + clasee.cantidadActual +"= Cantidad Max: " + clasee.cantidadMax)

                    Integer cantAct = clasee.disminuirCapActual()()

                    println("Nueva Cantidad Actual de Clase = " + cantAct)

                    Boolean resuCreditos = usuario.aumentarCreditos()

                    if (resuCreditos){
                        println("Nueva Cantidad de Creditos Actual = " + usuario.creditosActuales)
                                
                        //Elimino Usuario a la lista de anotados:
                        boolean resultadoFinal = clasee.eliminarUsuarioDeLista(usuario)
                                                    
                        if (!resultadoFinal){
                            println("DesanotarseClase - No se eliminar de la lista")
                            render("false")
                        }
                        else{
                            println("DesanotarseClase - SE ELIMINO SATISFACTORIAMENTE")
                            render("true")
                        }
                    }
                    else{
                        println("DesanotarseClase - No se pudo aumentar los creditos")
                        render("false")
                    }
                }
            }
            
        }
        catch(Exception e){
            println("PROBLEMA")
            println(e)

            render ("false")
        }

    }

    def listarClases(){
        //Para ver las clases desde el panel de control del admin
    }

    def listarClasesAnotadas(){
        //Para ver las clases desde la vista de usuario

        try{
            println("ListarClasesAnotadas - Voy a buscar los datos del usuario")

            def smgr = new SessionManager(request.session)
            Usuario usuario = smgr.getCurrentUser()

            def listaDeClases = []

            Tipousuario tipo = usuario.tipo

            def claseLista = Clase.findAllByTipo(tipo)

            for (Clase item: claseLista){
                boolean b = item.anotados.contains(usuario)

                if (b){
                    listaDeClases << item.id
                }
            }

            return(listaDeClases)

            render("true")

        }
        catch(Exception e){
            println("PROBLEMA")
            println(e)

            render ("false")
        }
    }


    def probar(){

        def claseLista = Clase.getAll()

        println(claseLista)

        // def clase3 = Clase.get(claseLista)

        // println(clase3)

        // def clasee2 = claseLista.sort{it.getHora()}

        // println(clasee2)

        // def claseLista.groupBy({it.tipo})

        // claseLista.groupBy({it.fechaHorario})

        // .getHora()

        def lista = []

        for (Clase item: claseLista){
            def clase3 = Clase.get(item.id)
            def hora1 = clase3.getHora()
            lista << hora1
            println(hora1)
        }

        println(lista)

        def lista2 = lista.unique()

        println(lista2)

        // println(claseLista.getHora())

        // groupBy{it.fechaHorario}

    }

}
