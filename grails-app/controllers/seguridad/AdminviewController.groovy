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

    def misDatos()
    {
        render(view:'misDatos')
    }

    def panelDeControl()
    {
        render(view:'panelDeControl')
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
        render view:"index", model:[listaFiltrada:listaFiltrada]
    }

    // def busquedaProfesor(){
    //     def listaFiltrada = Usuario.createCriteria().list(params) {
    //         ilike("rol.nombrerol","ROL_PROF")
    //         if(params.parametro){
    //             ilike("email", "%${params.parametro}%")
    //         }
        
    //     }
    //     if(!listaFiltrada){
    //         flash.message = "El profesor con email: ${params.parametro} no existe!"
    //     }
    //     render view:"index", model:[listaFiltrada:listaFiltrada]
    // }

    // def busquedaAdmin(){
    //     def listaFiltrada = Usuario.createCriteria().list(params) {
    //         ilike("rol.nombrerol","ROL_ADMIN")
    //         if(params.parametro){
    //             ilike("email", "%${params.parametro}%")
    //         }
        
    //     }
    //     if(!listaFiltrada){
    //         flash.message = "El admin con email: ${params.parametro} no existe!"
    //     }
    //     render view:"index", model:[listaFiltrada:listaFiltrada]
    // }



    def llego(){
        def ser = serv.nombreservicio
        println("llego")
        println("Parametros: "+serv.nombreservicio)
    }

    // def habilitarUsuario(){

    //     String emailUsuario = request.getParameter("email")

    //     Usuario u = Usuario.findByEmail(emailUsuario)

    //     String est = u.estado

    //     if (est == 'a'){

    //         println("Usuario ya Activo")

    //         render("yalotiene")
    //     }
    //     else{
    //         boolean resu = this.setEstadoActivo()

    //         if (resu){
    //             render("true")
    //         }
    //         else{
    //             render("false")
    //         }
    //     }
    // }

    // def cambiarSer(){

    //     String emailUsuario = request.getParameter("email")
    //     String serNombre = request.getParameter("nomser")

    //     Usuario u = Usuario.findByEmail(emailUsuario)
    //     Servicio s = Servicio.findByNombreservicio(serNombre)

    //     if (u.servicio.nombreservicio == s.nombreservicio){
    //         println("El usuario ya tenia ese servicio")
    //         render("yalotiene")
    //     }
    //     else{
    //         boolean resu = this.setServicio(s)
    //         if (resu){
    //             render("true")
    //         }
    //         else{
    //             render("false")
    //         }
    //     }
    // }

    // def cambiarCat(){

    //     String emailUsuario = request.getParameter("email")
    //     String catNombre = request.getParameter("nomcat")

    //     Usuario u = Usuario.findByEmail(emailUsuario)
    //     Tipousuario t = Tipousuario.findByNombre(catNombre)

    //     if (u.tipo.nombre == t.nombre){
    //         println("El usuario ya pertenecia a esta categoria")
    //         render("yalotiene")
    //     }
    //     else{
    //         boolean resu = this.setTipo(t)
    //         if (resu){
    //             render("true")
    //         }
    //         else{
    //             render("false")
    //         }
    //     }
    // }

}