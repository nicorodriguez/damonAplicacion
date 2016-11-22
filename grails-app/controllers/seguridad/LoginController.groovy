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
    	def smgr = new SessionManager(request.session)
        def u = smgr.getCurrentUser()
        if (u){
            redirect  (controller: "calendar" , action:"index")
        }
        else{
            render(view: 'index')
        }
    }

    def loguearse(){
    	println("Login - Voy a buscar los parametros")

    	// Capturo datos de post de formulario
	    String email = request.getParameter("email")
	    String password = request.getParameter("password")

	    // Traigo un usuario de la base de datos
        Usuario user = Usuario.findByEmail(email)
	    Usuario usuario = Usuario.findByEmailAndPassword(email,password)

        //Si el usuario existe:
        if(user){
            println("Usuario encontrado")
            //Si el email y contraseña son correctas:
            if(usuario){
                    Rol rol = usuario.rol
                    
                    def smgr = new SessionManager(request.session)
        
                    smgr.crearSesion(usuario,rol)
        
                    println(usuario.email+", "+usuario.rol)
        
                    render(1)
                }
            else{
                println("Email o contraseña incorrecta")
        
                render(2)
            }
        }
        else{
            println("Usuario inexistente")
            render(0)
        }

    }

    // Elimina la sesion actual.
    def logout() {
        def mySession = request.session
        def smgr = new SessionManager(mySession)
        def u = smgr.getCurrentUser()
        if (u){
            println("Usuario Encontrado")
            smgr.eliminarSesion()
            render("true")
        }
        else{
            println("Usuario No Encontrado")
            render("false")
        }
    }

    //Hay un usuario logeado?
    def isSessionActive(){
        def mySession = request.session
        def smgr = new SessionManager(mySession)

        // Retorna true o false como String
        render smgr.isActive()
    }

}
