//import seguridad.*
import seguridad.Usuario
import seguridad.Servicio
import seguridad.Rol
import grails.transaction.Transactional

@Transactional
class BootStrap {

    def init = { servletContext ->

      /*
    	Rol administradorRol = new Rol("ROL_ADMIN")
    	administradorRol.save(flush: true)
      Rol usuarioRol = new Rol("ROL_USUARIO")
      usuarioRol.save(flush: true)
      Rol profRole = new Rol("ROL_PROF")
      profRole.save(flush: true)

      Servicio serv1 = new Servicio("2VS",8)
      serv1.save(flush: true)
      Servicio serv2 = new Servicio("3VS",12)
      serv2.save(flush: true)
      Servicio serv3 = new Servicio("PL",30)
      serv3.save(flush: true)
      	
     	Usuario usuarioPrueba = new Usuario("nico55@hotmail.com","12345678","Nico",administradorRol,serv1)
     	usuarioPrueba.save(flush: true)
     	*/
    	
    }
    def destroy = {
    }
}