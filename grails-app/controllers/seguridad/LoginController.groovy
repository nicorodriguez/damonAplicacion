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
        try{
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
        catch(Exception e){
            println("PROBLEMA")
            println(e)

            render ("false")
        }

    }

    def relocalizar(){
        def smgr = new SessionManager(request.session)
        def u = smgr.getCurrentUser()

        if (u){
            def r = u.getRol()
            String nombreRol = r.getNombrerol()
            if (nombreRol == "ROL_USUARIO"){
                redirect  (controller: "calendar" , action:"index")
            }
            else{
                if (nombreRol == "ROL_ADMIN"){
                    // redirect  (controller: "calendar" , action:"index")
                }
                else{
                    if (nombreRol == "ROL_PROF"){
                        // redirect  (controller: "calendar" , action:"index")
                    }
                    else{
                        println("ERROR")
                    }
                }
            }
        }
        else{
            render(view: 'index')
        }
    }

    /*
        Agregar al login la verificacion de que el usuario ya verificó su cuenta:
            if (usuario.estado =! 'p'){
                println("se verifico correctamente el estado del usuario")
            }
            else{
                println("usuario pendiente de verificacion de correo")
            }
    */

    // Elimina la sesion actual.
    def logout() {
        def mySession = request.session
        def smgr = new SessionManager(mySession)
        def u = smgr.getCurrentUser()
        if (u){
            println("Usuario Encontrado")
            smgr.eliminarSesion()
            println("Sesion Cerrada")
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

    def contacto(){
        render(view:'contacto')
    }

    def quienes(){
        render(view:'quienes')
    }

}
