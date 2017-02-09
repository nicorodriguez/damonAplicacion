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

    def index(){
        def smgr = new SessionManager(request.session)
        def u = smgr.getCurrentUser()
        if (u){
            def rol = u.getRol()
            String nombreRol = rol.getNombrerol()
            if (nombreRol == "ROL_USUARIO"){
                render(view: 'index')
            }
            else{
                smgr.eliminarSesion()
                redirect(controller: "login" , action:"index")
            }
        }
        else{
            redirect(controller: "login" , action:"index")
        }
    }

    def misDatos()
    {
        render(view:'misDatos')
    }

    def panelDeControl()
    {
        render(view:'panelDeControl')
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
            Date fechaDate = Date.parse( 'EEEE dd/MM/yyyy HH:mm', fecha )

            println("CrearClase -> "+fechaDate)

            //Traer los profesores de la base de datos verifica que existe
            // println("CrearClase - Voy a buscar el Profesor")
            // Usuario prof = Usuario.findByEmail(profeEmail)

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
                Clase clasee = new Clase(fechaDate,profeEmail,tipo1,maxCantidad)

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

    // @Transactional
    def anotarseClase(){
        
        try{
            println("AnotarseClase - Voy a buscar los parametros")

            // Capturo datos de post de formulario
            String fecha = request.getParameter("fechahor")
            String tipoClase = request.getParameter("tipoclase")

            println("Recibi los parametros: -> "+fecha+", "+tipoClase)

            //Verificar las fechas en las funciones de javascript
            //Paso las fechas de strings a date
            println("AnotarseClase - Voy a parsear la date")
            Date fechaDate = Date.parse( 'dd/MM/yyyy HH:mm', fecha )

            //Voy a buscar el tipo de Clase
            Tipousuario tipoClasePosta = Tipousuario.findByNombre(tipoClase)

            println("TipoClase: "+tipoClasePosta.nombre)
            println(tipoClasePosta)

            //Traigo los datos de la clase:
            println("AnotarseClase - Voy a ver si existe la clase")
            Clase clasee = Clase.findByFechaHorarioAndTipo(fechaDate,tipoClasePosta)
            
            //Verifico que exista la clase
            if (!clasee){
                println("AnotarseClase - Clase inexistenete en esa fecha, horario y con ese tipo")
                render("false")
            }
            else{
                //Verifico que la es posible anotarse dependiendo de la fecha y la hora
                boolean tiempoPosible = clasee.verificoTiempo()

                if (tiempoPosible){

                    println("AnotarseClase - Tiempo valido para anotarse")

                    //Traer los datos del usuario:
                    def smgr = new SessionManager(request.session)
                    Usuario usuario = smgr.getCurrentUser()

                    //Traigo el tipo del usuario
                    Tipousuario tipoUsuario = usuario.tipo

                    println("TipoUsuario: "+tipoUsuario.nombre)
                    println(tipoUsuario)

                    //Comparo el tipo de usuario con el tipo de la clase
                    if (tipoUsuario.nombre != tipoClasePosta.nombre){
                        println("AnotarseClase - Tipo de clase y tipo de usuario no concuerdan!!")
                        render("false")
                    }
                    else{
                        println("AnotarseClase - Tipo de clase y tipo de usuario concuerdan -- Continuo")

                        println("AnotarseClase - Voy a verificar que no se encuentre ya anotado")
                        // Boolean anotado = usuario.yaAnotado(clasee)
                        // !usuario.yaAnotado(clasee)
                        if (true){
                            println("AnotarseClase - No se encuentra anotado a la clase -- Continuo")

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

                                    Boolean resuCreditos = usuario.disminuirCreditos()

                                    if (resuCreditos){
                                        println("Nueva Cantidad de Creditos Actual = " + usuario.creditosActuales)
                                        
                                        // Agrego Usuario a la lista de anotados:
                                        boolean resultadoFinal = clasee.agregarUsuarioALista(usuario)
                                                            
                                        if (!resultadoFinal){
                                            println("AnotarseClase - No se pudo agregar a la lista")
                                            render("false")
                                        }
                                        else{

                                            Integer cantAct = clasee.calcularCapActual()

                                            println("Nueva Cantidad Actual de Clase = " + cantAct)

                                            // def claseid = clasee.id
                                            // Clase claseaguardar = Clase.get(claseid)
                                            // claseaguardar.save(flush: true, failOnError: true)

                                            clasee.merge(flush: true, failOnError: true)
                                            // clasee.save(flush: true, failOnError: true)

                                            println("AnotarseClase - SE AGREGO SATISFACTORIAMENTE")

                                            // clasee.merge(flush: true)

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
                        else{
                            println("AnotarseClase - No se anoto al usuario porque ya se encuentra anotado")
                            render("yaanotado")
                        }
                    }
                }
                else{
                    println("AnotarseClase - Ya no hay tiempo para anotarse")
                    render("tarde")
                }
            }
            
        }
        catch(Exception e){
        // catch(ValidationException v){
            println("PROBLEMA")
            println(e)

            // println("VALIDACION")
            // println(v)

            render ("false")
        }

        
    }

    // @Transactional
    def desanotarseClase(){

        try{

            println("DesanotarseClase - Voy a buscar los parametros")

            // Capturo datos de post de formulario
            String fecha = request.getParameter("fechahor")
            String tipoClase = request.getParameter("tipoclase")

            println("Recibi los parametros: -> "+fecha+", "+tipoClase)


            //Verificar las fechas en las funciones de javascript
            //Paso las fechas de strings a date
            println("desanotarseClase - Voy a parsear la date")
            Date fechaDate = Date.parse( 'dd/MM/yyyy HH:mm', fecha )

            //Voy a buscar el tipo de Clase
            Tipousuario tipoClasePosta = Tipousuario.findByNombre(tipoClase)

            println("TipoClase: "+tipoClasePosta.nombre)
            println(tipoClasePosta)

            //Traigo los datos de la clase:
            println("desanotarseClase - Voy a buscar la clase")
            Clase clasee = Clase.findByFechaHorarioAndTipo(fechaDate,tipoClasePosta)

            
            
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
                if (tipoUsuario.nombre != tipoClasePosta.nombre){
                    println("DesanotarseClase - Tipo de clase y tipo de usuario no concuerdan!!")
                    render("false")
                }
                else{
                    println("DesanotarseClase - Tipo de clase y tipo de usuario concuerdan -- Continuo")

                    println("DesanotarseClase - Clase con lugar disponible")
                    println("Cantidad Actual: " + clasee.cantidadActual +"= Cantidad Max: " + clasee.cantidadMax)
                    

                    Boolean resuCreditos = usuario.aumentarCreditos()

                    if (resuCreditos){
                        println("Nueva Cantidad de Creditos Actual = " + usuario.creditosActuales)
                        
                        def claseid = clasee.id
                        Clase claseaguardar = Clase.get(claseid)

                        // boolean resuu = usuario.eliminarUsuarioDeInscriptos(claseaguardar)
                        // println(resuu)

                        //Elimino Usuario a la lista de anotados:
                        boolean resultadoFinal = claseaguardar.eliminarUsuarioDeLista(usuario)
                                                    
                        if (!resultadoFinal){
                            println("DesanotarseClase - No se eliminar de la lista")
                            render("false")
                        }
                        else{
                            println("DesanotarseClase - SE ELIMINO SATISFACTORIAMENTE")

                            // Integer cantAct = clasee.calcularCapActual()

                            // println("Nueva Cantidad Actual de Clase = " + cantAct)

                            // clasee.save(flush: true)

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

            // def smgr = new SessionManager(request.session)
            // Usuario usuario = smgr.getCurrentUser()

            Usuario usuario = Usuario.findByEmail("lucasg@hotmail.com")

            def listaDeClases = []

            Tipousuario tipo = usuario.tipo

            def claseLista = Clase.findAllByTipo(tipo)

            for (Clase item: claseLista){
                boolean b = item.anotados.contains(usuario)

                if (b){
                    listaDeClases << item
                }
            }

            println(listaDeClases)
            // return(listaDeClases)

            // render("true")

        }
        catch(Exception e){
            println("PROBLEMA")
            println(e)

            // render ("false")
        }
    }

    def guiaEjercicio(){
        render(view:'guiaEjercicio')
    }

    def probar(){

        def claseLista = Clase.getAll()

        println(claseLista)

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

    }

}
