package seguridad
import seguridad.Usuario
import seguridad.Rol
import seguridad.Servicio
import sistema.Tipousuario
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
            def rolPrueba = Rol.findByNombrerol("ROL_USUARIO")

            if (rolPrueba){
               println("Las cosas por default ya fueron creadas") 
            }
            else{
                println("voy a crear los roles, servicios y usuario por default")

                println("Ya se crearon los Servicios, Roles y Usuario")
                
            }

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
                render("false")
            }
            else{

    	        Servicio serv = Servicio.findByNombreservicio(modalidad)
                Rol usuariorol = Rol.findByNombrerol("ROL_USUARIO")
                Tipousuario tipoPendiente = Tipousuario.findByNombre("PENDIENTE")
                
    	        Usuario user = new Usuario(email,password,nombre,apellido,usuariorol,serv,tipoPendiente)
    	        user.save(flush: true)
                println(user)

                usuariorol.agregarUsuario(user)
                usuariorol.save(flush: true)

                def a = usuariorol.usuariosrol
                println(a)

                redirect  (controller: "login" , action:"index")

    	        //render ("true")
            }
    	}
    	catch(Exception e){
    		println("PROBLEMA")
    		println(e)

    		render ("false")
    	}

    }
}
