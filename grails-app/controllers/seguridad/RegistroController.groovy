package seguridad
import seguridad.Usuario
import seguridad.Rol
import seguridad.Servicio
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession
import grails.transaction.Transactional
import session.SessionManager

class RegistroController {

    def index(){
    	render(view: 'index')
    }

    @Transactional
    def crearUsuario(){
    	try{
            println("Voy a buscar los parametros")

	    	String email = request.getParameter("email")
	        String password = request.getParameter("password")
	        String nombre = request.getParameter("nomb")
            String apellido = request.getParameter("apell")
	        String modalidad = request.getParameter("modal")

            println("Recibi los parametros: -> "+email+", "+password+", "+nombre+", "+apellido+", "+modalidad)

            Usuario u = Usuario.findByEmail(email)

            if (u){
                println("Usuario ya creado")
                render ("false")
            }
            else{

    	        Servicio serv = Servicio.findByNombreservicio(modalidad)
                Rol usuariorol = Rol.findByNombrerol("ROL_USUARIO")

                
    	        Usuario user = new Usuario(email,password,nombre,apellido,usuariorol,serv)
    	        user.save(flush: true)
                println(user)

                usuariorol.agregarUsuario(user)
                usuariorol.save(flush: true)

                def a = usuariorol.usuariosrol
                println(a)

                println("Llegue al render")
    	        render ("true")
                println("Sali del render")
            }
    	}
    	catch(Exception e){
    		println("PROBLEMA")
    		println(e)

    		render ("false")
    	}

    }

    def buscoUsuario(){
        render true;
    }

    def redireccionarAlLogin(){
        redirect(url: "damonAplicacion/")
        //redirect(controller: "login" , action:"index")
    }
}
