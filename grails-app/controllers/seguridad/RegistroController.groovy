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
            def rolPrueba = Rol.findByNombrerol("ROL_USUARIO")

            if (rolPrueba){
               println("Las cosas por default ya fueron creadas") 
            }
            else{
                println("voy a crear los roles, servicios y usuario por default")
                
                Rol administradorRol = new Rol("ROL_ADMIN")
                administradorRol.inicializarTablaRol()
                administradorRol.save(flush: true)

                Rol usuarioRol = new Rol("ROL_USUARIO")
                usuarioRol.inicializarTablaRol()
                usuarioRol.save(flush: true)

                Rol profRole = new Rol("ROL_PROF")
                profRole.inicializarTablaRol()
                profRole.save(flush: true)
            
                Servicio serv1 = new Servicio("2VS",8)
                serv1.inicializarTablaServ()
                serv1.save(flush: true)

                Servicio serv2 = new Servicio("3VS",12)
                serv2.inicializarTablaServ()
                serv2.save(flush: true)

                Servicio serv3 = new Servicio("PL",30)
                serv3.inicializarTablaServ()
                serv3.save(flush: true)
            
                
                Usuario usuarioPrueba = new Usuario("ni.co55@hotmail.com","12345678","Nico","Rodriguez",administradorRol,serv3)
                usuarioPrueba.save(flush: true)
                administradorRol.agregarUsuario(usuarioPrueba)
                administradorRol.save(flush: true)

                println("Ya se crearon los Servicios, Roles y Usuario")
                
            }

            println("Voy a buscar los parametros")

	    	String email = request.getParameter("email")
	        String password = request.getParameter("password")
	        String nombre = request.getParameter("nomb")
            String apellido = request.getParameter("apell")
	        String modalidad = request.getParameter("modal")

            println("Recibi los parametros: ->"+email+", "+password+", "+nombre+", "+apellido+", "+modalidad)

            Usuario u = Usuario.findByEmail(email)

            if (u){
                println("Usuario ya creado")
                render("false")
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

    	        render ("true")
            }
    	}
    	catch(Exception e){
    		println("PROBLEMA")
    		println(e)

    		render ("false")
    	}

    }
}
