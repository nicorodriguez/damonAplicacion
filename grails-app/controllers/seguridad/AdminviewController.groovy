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

class AdminviewController {

	// def index(){
 //        render(view: 'index')
	// }

	def index(){
        println("entre a la pag del index")
		def smgr = new SessionManager(request.session)
    	def u = smgr.getCurrentUser()
    	if (u){
    		def rol = u.getRol()
    		String nombreRol = rol.getNombrerol()
    		if (nombreRol == "ROL_ADMIN"){
    			println("voy a la pag del admin")
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
    def adminUsuario(){
        render(view:'adminUsuario')
    }

    def misDatos(){
        render(view:'misDatos')
    }

    def panelDeControl(){
        render(view:'panelDeControl')
    }

    def adminServicio(){
        render(view: 'adminServicio')
    }

    def adminCategoria(){
        render(view: 'adminCategoria')
    }

    def busquedaUsuario(){
        def listaFiltrada = Usuario.createCriteria().list(params) {
            if(params.parametro){
                ilike("email", "%${params.parametro}%")
            }
        
        }
        if(!listaFiltrada){
            flash.message = "El usuario con email: ${params.parametro} no existe!"
        }
        render view:"adminUsuario", model:[listaFiltrada:listaFiltrada]
    }

    def busquedaUsuario1(){
        def listaFiltrada = Usuario.createCriteria().list(params) {
            if(params.parametro){
                ilike("email", "%${params.parametro}%")
            }
        
        }
        if(!listaFiltrada){
            flash.message = "El usuario con email: ${params.parametro} no existe!"
        }
        render view:"panelDeControl", model:[listaFiltrada:listaFiltrada]
    }


    def busquedaServicio(){
        def listaFiltrada = Servicio.createCriteria().list(params) {
            if(params.parametro){
                ilike("nombreservicio", "%${params.parametro}%")
            }
        
        }
        if(!listaFiltrada){
            flash.message = "El servicio de nombre: ${params.parametro} no existe!"
        }
        render view:"adminServicio", model:[listaFiltrada:listaFiltrada]
    }

    // def busquedaRol(){
    //     def listaFiltrada = Rol.createCriteria().list(params) {
    //         if(params.parametro){
    //             ilike("nombrerol", "%${params.parametro}%")
    //         }
        
    //     }
    //     if(!listaFiltrada){
    //         flash.message = "El rol de nombre: ${params.parametro} no existe!"
    //     }
    //     render view:"index", model:[listaFiltrada:listaFiltrada]
    // }

    def busquedaTipo(){
        def listaFiltrada = Tipousuario.createCriteria().list(params) {
            if(params.parametro){
                ilike("nombre", "%${params.parametro}%")
            }
        
        }
        if(!listaFiltrada){
            flash.message = "El tipousuario de nombre: ${params.parametro} no existe!"
        }
        render view:"adminCategoria", model:[listaFiltrada:listaFiltrada]
    }

    def crearServ(){

        try{

            String nomb = request.getParameter("nomb")
            String cred = request.getParameter("creditos")

            Integer cantcred = cred.toInteger()

            Servicio serviciocreado = Servicio.findByNombreservicio(nomb)

            if (serviciocreado){
                println("Servicio ya creado con dicho nombre")
                render("yacreado")
            }
            else{
                Servicio servnuevo = new Servicio(nomb,cantcred)
                servnuevo.inicializarTablaServ()
                servnuevo.save(flush: true)

                render("true")
            }

        }
        catch(Exception e){
            println("PROBLEMA")
            println(e)

            render ("false")
        }
    }

    def crearTipo(){

        try{

            String nomb = request.getParameter("nomb")

            Tipousuario tipocreado = Tipousuario.findByNombre(nomb)

            if (tipocreado){
                println("Tipo ya creado con dicho nombre")
                render("yacreado")
            }
            else{
                Tipousuario tipoNuevo = new Tipousuario(nomb)
                tipoNuevo.inicializarTablaTipo()
                tipoNuevo.save(flush: true)

                render("true")
            }

        }
        catch(Exception e){
            println("PROBLEMA")
            println(e)

            render ("false")
        }
    }

    def eliminarServ(){
        try{

           String nomb = request.getParameter("nomb")

           Servicio servicioexistente = Servicio.findByNombreservicio(nomb)

           if (servicioexistente){
                Servicio servborrar = Servicio.get()
                servborrar.delete(flush: true, failOnError: true)
                render("true")
           }
           else{
                println("Servicio inexistente")
                render("inexistente")
           }

        }
        catch(Exception e){
            println("PROBLEMA")
            println(e)

            render ("false")
        }
    }

    def eliminarTipo(){

        try{

           String nomb = request.getParameter("nomb")

           Tipousuario tipoexistente = Tipousuario.findByNombre(nomb)

           if (tipoexistente){
                Tipousuario tipborrar = Tipousuario.get()
                tipborrar.delete(flush: true, failOnError: true)
                render("true")
           }
           else{
                println("Tipo inexistente")
                render("inexistente")
           }

        }
        catch(Exception e){
            println("PROBLEMA")
            println(e)

            render ("false")
        }
    }


    // def llego(){
    //     def ser = serv.nombreservicio
    //     println("llego")
    //     println("Parametros: "+serv.nombreservicio)
    // }

}