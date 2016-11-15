package seguridad
import seguridad.Usuario
import seguridad.Rol
import seguridad.Servicio
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession
import grails.transaction.Transactional
import session.SessionManager

class LoginController {

    def index(){
    	render(view: 'index')
    }

    def loguearse(){
    	println("Voy a buscar los parametros")

    	// Capturo datos de post de formulario
	    String email = request.getParameter("email")
	    String password = request.getParameter("password")

	    // Traigo un usuario de la base de datos
	    Usuario usuario = Usuario.findByEmailAndPassword(email,password)
	    Rol rol = usuario.rol
	    // Si el usuario existe, guardarlo en la sesion. Retornar el string Success
        if(usuario){
            def smgr = new SessionManager(request.session)

            smgr.crearSesion(usuario,rol)

            println(usuario.email+", "+usuario.rol)

            render("true")
        }
        else{

        	println("Email o usuario incorrecto")

        	render("false")
        }


    }

    // Elimina la sesion actual.
    def logout() {
        def mySession = request.session
        def smgr = new SessionManager(mySession)
        smgr.eliminarSesion()
    }

    //Hay un usuario logeado?
    def isSessionActive(){
        def mySession = request.session
        def smgr = new SessionManager(mySession)

        // Retorna true o false como String
        render smgr.isActive()
    }

}
