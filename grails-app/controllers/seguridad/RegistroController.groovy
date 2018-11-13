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

class RegistroController {

    def index(){
            render(view: 'index')
    }
    

    // def ver(){
    //     render(view: 'index')
    // }

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
            String sexo = request.getParameter("sex")
	        String modalidad = request.getParameter("modal")

            println("Recibi los parametros: -> "+email+", "+password+", "+nombre+", "+apellido+", "+modalidad+", "+sexo)

            Usuario u = Usuario.findByEmail(email)

            if (u){
                println("Usuario ya creado")
                render ("existe")
            }
            else{

    	        Servicio serv = Servicio.findByNombreservicio(modalidad)
                Rol usuariorol = Rol.findByNombrerol("ROL_USUARIO")
                Tipousuario tipoPendiente = Tipousuario.findByNombre("PENDIENTE")
                
    	        Usuario user = new Usuario(email,password,nombre,apellido,sexo,usuariorol,serv,tipoPendiente)
    	        user.save(flush: true)
                println(user)

                usuariorol.agregarUsuario(user)
                usuariorol.save(flush: true)
                println(usuariorol)

                sendMail {
                   to "rodrigueznicolas.9319@gmail.com", email
                   subject "Validación del Sistema DAMON CF"
                   html '<h2>Este es el mail para confirmar tu registro a la página DAMON CF</h2>'
                        '<br>'
                        '<h4>Código de validación: abuvbijoa25562</h4>'
                };

                // redirect  (controller: "login" , action:"index")
            }
            render ("true");
    	}
    	catch(Exception e){
    		println("PROBLEMA")
    		println(e)

    		render ("false")
    	}

    }

    @Transactional
    def modificarSexo(){
        try{
            Usuario admin = Usuario.findByEmail("ni.co55@hotmail.com")

            Usuario adminNuevo = Usuario.get(admin.id)
            adminNuevo.nombre = "Nico2"

            adminNuevo.save(flush: true)
        }
        catch(Exception e){
            println("PROBLEMA")
            println(e)

            render ("false")
        }
    }
}
