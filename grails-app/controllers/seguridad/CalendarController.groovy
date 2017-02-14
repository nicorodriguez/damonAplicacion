package seguridad
import seguridad.Usuario
import seguridad.Rol
import seguridad.Servicio
import sistema.Clase
import sistema.Tipousuario
import sistema.Establecimiento
import sistema.Comentario
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

    def misDatos(){
        def smgr = new SessionManager(request.session)
        def u = smgr.getCurrentUser()
        if (u){
            render(view:'misDatos')
        }
        else{
            redirect(controller: "login" , action:"index")
        }
    }

    def guiaEjercicio(){
        def smgr = new SessionManager(request.session)
        def u = smgr.getCurrentUser()
        if (u){
            render(view:'guiaEjercicio')
        }
        else{
            redirect(controller: "login" , action:"index")
        }
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

    @Transactional
    def eliminarClase(){
        
        //Nota: traer los profesores disponibles del servidor con email y nombre, luego al crear la clase pasar sólo el email por parametro

        try{
            println("EliminarClase - Voy a buscar los parametros")

            // Capturo datos de post de formulario
            String idclase = request.getParameter("id")
            // String fecha = request.getParameter("fecha")
            // String tipoUsuario = request.getParameter("tipous")
            
            // println("Recibi los parametros: -> "+fecha+", "+tipoUsuario)
            // println("FECHA: "+fecha)
            // println("TIPO USUARIO: "+tipoUsuario)

            // //Verificar las fechas en las funciones de javascript
            // //Paso las fechas de strings a date
            // println("EliminarClase - Voy a parsear la date")
            // Date fechaDate = Date.parse( 'EEEE dd/MM/yyyy HH:mm', fecha )

            // println("EliminarClase -> "+fechaDate)

            // //Traer los tipos de la base de datos verifica que existen
            // println("EliminarClase - Voy a buscar el Tipo de Usuario")
            // Tipousuario tipo1 = Tipousuario.findByNombre(tipoUsuario)

            //Verifico que no existe una clase en ese dia, horario y con dicho tipo
            // println("EliminarClase - Voy a ver si existe la clase")
            // Clase clasevieja = Clase.findByFechaHorarioAndTipo(fechaDate,tipo1)

            println("EliminarClase - Voy a ver si existe la clase")
            Clase clasevieja = Clase.findById(idclase)

            if (clasevieja){
                println("EliminarClase - Se encontro clase con esa fecha y con ese tipo")

                Clase borrarclase = Clase.get(clasevieja.id)
                borrarclase.inicializarTablaAnotados()
                borrarclase.profe = null
                borrarclase.save(flush: true, failOnError: true)

                borrarclase.delete(flush: true, failOnError: true)

                println("EliminarClase - CLASE CREADA SATISFACTORIAMENTE")
                render("true")
            }
            else{
                println("EliminarClase - No se encontro una clase que cumpla la fecha y el tipo")
                render("inexistente")
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
            println("PROBLEMA")
            println(e)
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
                    
                    boolean tiempoPosible = clasee.verificoTiempo()

                    if (tiempoPosible){

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
                    else{
                        println("DesanotarseClase - Ya no hay tiempo para desanotarse")
                        render("tarde")
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

    def editarUsuario(){

        try{
            println("editarUsuario - Voy a buscar los parametros")

            // Capturo datos de post de formulario
            String email = request.getParameter("email")
            String servicio = request.getParameter("servicio")
            String tipo = request.getParameter("tipo")
            String estado = request.getParameter("estado")

            println("Recibi los parametros: -> "+email+", "+servicio+", "+tipo+", "+estado)

            //Voy a buscar al usuario
            Usuario usuario = Usuario.findByEmail(email)

            boolean esPriv = usuario.esPrivilegiado()

            if (esPriv){

                //Voy a buscar el tipo a cambiar
                Tipousuario tipocambiar = Tipousuario.findByNombre(tipo)

                //Voy a buscar el servicio a cambiar
                Servicio servcambiar = Servicio.findByNombreservicio(servicio)

                //Busco el verdadero usuario
                Usuario userACambiar = Usuario.get(usuario.id)

                if (tipocambiar.nombre != userACambiar.tipo.nombre){
                    boolean a = userACambiar.setTipo(tipocambiar)
                    if(a){
                        println("Se cambio el tipo porque era diferente, ahora es: "+ userACambiar.tipo.nombre)
                    }
                }

                if (servcambiar.nombreservicio != userACambiar.servicio.nombreservicio){
                    boolean b = userACambiar.setServicio(servcambiar)
                    if(b){
                        println("Se cambio el tipo porque era diferente, ahora es: "+ userACambiar.servicio.nombreservicio)
                    }
                }

                if (estado != userACambiar.estado){
                    boolean c = userACambiar.setEstado(estado)
                    if(c){
                        println("Se cambio el tipo porque era diferente, ahora es: "+ userACambiar.estado)
                    }
                }

                userACambiar.save(flush: true, failOnError: true)

                render("true")
            }
            else{
                println("No tiene el rol necesario")
                render("noadmin")
            }
        }
        catch(Exception e){
            println("PROBLEMA")
            println(e)

            render ("false")
        }
    }

    // def resetearClases(){
        
    //     try{
        
    //         Date fechaAct = new Date()

    //         def formatoNumdia = new SimpleDateFormat("u")
    //         String numm = formatoNumdia.format(fechaAct)
    //         Integer numd = numm.toInteger()
    
    //         def formatoHora = new SimpleDateFormat("HH")
    //         String hor = formatoHora.format(fechaAct)
    //         Integer horaa = hor.toInteger()

    //         boolean posibleDomLun = ((numd == 7) || (numd == 1))

    //         boolean posibleSab = ((numd == 6) && (horaa > 20))

    //         if (posibleSab || posibleDomLun){

    //             fecha1
    //    //       Date fechaDate = Date.parse( 'dd/MM/yyyy HH:mm', fecha1 )

    //             def listaClases = Clase.getAll()

    //             for(Clase item: listaClases){
    //                 Clase clase1 = Clase.get(item.id)
    //                 Date fechaClase = clase1.fechaHorario
    //                 clase1.fechaHorario = fechaClase.plus(7)
    //                 clase1.inicializarTablaAnotados()
    //                 clase1.save(flush: true)
    //             }


    //         }
    //         else{
    //             println("No es posible ejecutar este metodo los dias que no sean sabado, domingo o lunes")
    //         }
    //     }
        
    //     catch(Exception e){
    //         println("PROBLEMA")
    //         println(e)

    //         render ("false")
    //     }
    // }

    def resetearCreds(){

        try{
            def smgr = new SessionManager(request.session) 
            Usuario usuario = smgr.getCurrentUser()
            Usuario usuariocambiar = Usuario.get(usuario.id)

            boolean b = usuariocambiar.resetarCreditos()
            usuariocambiar.save(flush: true, failOnError: true)

            if (b){
                println("resetearCreds - Se resetearon los creditos con exito")
                render("true")
            }
            else{
                println("resetearCreds - Hubo un error al resetear")
                render("false")
            }
        }
        catch(Exception e){
            println("PROBLEMA")
            println(e)

            render ("false")
        }
    }

    def cambiarNombre(){

        try{
            String nomb = request.getParameter("nombre")

            def smgr = new SessionManager(request.session) 
            Usuario usuario = smgr.getCurrentUser()
            Usuario usuariocambiar = Usuario.get(usuario.id)

            boolean b = usuariocambiar.setNombre(nomb)
            usuariocambiar.save(flush: true, failOnError: true)

            if (b){
                println("cambiarNombre - Se cambio el nombre con exito")
                render("true")
            }
            else{
                println("cambiarNombre - Hubo un error al cambiar el nombre")
                render("false")
            }
        }
        catch(Exception e){
            println("PROBLEMA")
            println(e)

            render ("false")
        }
    }

    def cambiarApellido(){
        try{
            String apel = request.getParameter("apellido")

            def smgr = new SessionManager(request.session) 
            Usuario usuario = smgr.getCurrentUser()
            Usuario usuariocambiar = Usuario.get(usuario.id)

            boolean b = usuariocambiar.setApellido(apel)
            usuariocambiar.save(flush: true, failOnError: true)

            if (b){
                println("cambiarApellido - Se cambio el apellido con exito")
                render("true")
            }
            else{
                println("cambiarApellido - Hubo un error al cambiar el apellido")
                render("false")
            }
        }
        catch(Exception e){
            println("PROBLEMA")
            println(e)

            render ("false")
        }
    }

    def cambiarContrasenia(){
        try{

            String passv = request.getParameter("contraseniav")
            String passn = request.getParameter("contrasenian")

            // Usuario user = Usuario.findByEmail(email)
            def smgr = new SessionManager(request.session) 
            Usuario usuario = smgr.getCurrentUser()
            Usuario usuariocambiar = Usuario.get(usuario.id)

            if (usuariocambiar.password == passv){

                boolean b = usuariocambiar.setPassword(passn)
                usuariocambiar.save(flush: true, failOnError: true)

                if (b){
                    println("cambiarContrasenia - Se cambio la contrasenia con exito")
                    render("true")
                }
                else{
                    println("cambiarContrasenia - Hubo un error al cambiar la contrasenia")
                    render("false")
                }
            }
            else{
                println("cambiarContrasenia - no coincide la constrania vieja!")
                render ("nocoincide")
            }
        }
        catch(Exception e){
            println("PROBLEMA")
            println(e)

            render ("false")
        }
    }

    def cambiarRol(){
        try{
            String rolnombre = request.getParameter("rol")

            def smgr = new SessionManager(request.session) 
            Usuario usuario = smgr.getCurrentUser()
            Usuario usuariocambiar = Usuario.get(usuario.id)

            Rol r = Rol.findByNombrerol(rolnombre)
            Rol rolcambiar = Rol.get(r.id)

            if (rolcambiar.nombrerol == "ROL_ADMIN"){
                Tipousuario tipocambiar = Tipousuario.findByNombre("ADMIN")
                Servicio servcambiar = Servicio.findByNombreservicio("Admin")

                boolean b = usuariocambiar.setRol(rolcambiar)
                boolean c = usuariocambiar.setServicio(tipocambiar)
                boolean d = usuariocambiar.setTipo(servcambiar)

                usuariocambiar.save(flush: true, failOnError: true)

            }
            else{
                if (rolcambiar.nombrerol == "ROL_PROF"){
                    Tipousuario tipocambiar = Tipousuario.findByNombre("PROFESOR")
                    Servicio servcambiar = Servicio.findByNombreservicio("Profesor")

                    boolean b = usuariocambiar.setRol(rolcambiar)
                    boolean c = usuariocambiar.setServicio(tipocambiar)
                    boolean d = usuariocambiar.setTipo(servcambiar)

                    usuariocambiar.save(flush: true, failOnError: true)
                }
                else{
                    if (rolcambiar.nombrerol == "ROL_USUARIO"){
                        Tipousuario tipocambiar = Tipousuario.findByNombre("CROSSFITERO")
                        Servicio servcambiar = Servicio.findByNombreservicio("2 veces por semana")

                        boolean b = usuariocambiar.setRol(rolcambiar)
                        boolean c = usuariocambiar.setServicio(tipocambiar)
                        boolean d = usuariocambiar.setTipo(servcambiar)

                        usuariocambiar.save(flush: true, failOnError: true)
                    }
                    else{
                        println("cambiarRol - Error en la busqueda del rol")
                        render("false")
                    }
                }
            }

            if (b && c && d){
                println("cambiarRol - Se cambio el rol con exito")
                render("true")
            }
            else{
                println("cambiarRol - Hubo un error al cambiar el rol")
                render("false")
            }
        }
        catch(Exception e){
            println("PROBLEMA")
            println(e)

            render ("false")
        }
    }


    def iniciarlun(){

        Date fechaAct = new Date()

        def formatoNumdia = new SimpleDateFormat("u")
        String numm = formatoNumdia.format(fechaAct)

        Integer numdia = numm.toInteger()

        if (numdia == 1){
            def formatoNumdiafecha2 = new SimpleDateFormat("dd")

            String numdf = formatoNumdiafecha2.format(fechaAct)

            println(fechaAct)
            println(numdf)
            // return(numdf)
        }
        else{
            Integer cantV = nummdia - 1

            Date lunesAnt = fechaAct.minus(cantV)

            def formatoNumdiafecha1 = new SimpleDateFormat("dd")

            String numdf = formatoNumdiafecha1.format(lunesAnt)

            println(lunesAnt)
            println(numdf)
            // return(numdf)
        }

    }

    def nuevoComentario(){

        String titulo = request.getParameter("titulo")
        String descripcion = request.getParameter("descripcion")

        Comentario c = new Comentario(titulo, descripcion)

        c.save(flush: true, failOnError: true)

    }

    def borrarComentario(){

        String id = request.getParameter("id")

        Integer idComentario = id.toInteger()

        Comentario c = Comentario.get(idComentario)

        c.delete(flush: true, failOnError: true)
    }

    // def probar(){

    //     def claseLista = Clase.getAll()

    //     println(claseLista)

    //     def lista = []

    //     for (Clase item: claseLista){
    //         def clase3 = Clase.get(item.id)
    //         def hora1 = clase3.getHora()
    //         lista << hora1
    //         println(hora1)
    //     }

    //     println(lista)

    //     def lista2 = lista.unique()

    //     println(lista2)

    // }

    def probar2(){

        Date fechaAct = new Date()

        Date semanaQviene = fechaAct.plus(7)

        println("Dia Actual: "+fechaAct)
        println("Dia Semana siguiente: "+semanaQviene)
    }

}
