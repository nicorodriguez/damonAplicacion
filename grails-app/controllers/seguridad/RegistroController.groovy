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
            
                
                Usuario usuarioPrueba = new Usuario("ni.co55@hotmail.com","12345678","Nico","Rodriguez")
                usuarioPrueba.setRol(administradorRol)
                usuarioPrueba.setServicio(serv3)
                usuarioPrueba.save(flush: true)
                

                println("Ya se crearon los Servicios, Roles y Usuario")
                
            }

            println("Voy a buscar los parametros")

	    	String email = request.getParameter("email")
	        String password = request.getParameter("password")
	        String nombre = request.getParameter("nomb")
            String apellido = request.getParameter("apell")
	        String modalidad = request.getParameter("modal")

            println("Recibi los parametros:"+email+" "+password+" "+nombre+" "+apellido+" "+modalidad)

            if (modalidad == "2 Veces por semana"){
                modalidad = "2VS"
                println(modalidad)
            }
            else{
                if (modalidad == "3 veces por semana"){
                    modalidad = "3VS"
                    println(modalidad)
                }
                else{
                    if(modalidad == "Pase libre"){
                        modalidad = "PL"
                        println(modalidad)
                    }
                    else{
                        println("Modalidad Invalida")
                        render("false")
                    }
                }
            }

	        Servicio serv = Servicio.findByNombreservicio(modalidad)
            Rol usuariorol = Rol.findByNombrerol("ROL_USUARIO")

            /*
	        Usuario user = new Usuario(email,password,nombre,apellido)
            usuarioPrueba.setRol(usuariorol)
            usuarioPrueba.setServicio(serv)
	        user.save(flush: true)
            */

	        render ("true")
    	}
    	catch(Exception e){
    		println("PROBLEMA")
    		println(e)

    		render ("false")
    	}

    }
}