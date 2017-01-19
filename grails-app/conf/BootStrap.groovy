import seguridad.*
import sistema.*
import grails.transaction.Transactional

@Transactional
class BootStrap {

    def init = { servletContext ->
      
    	Rol administradorRol = new Rol("ROL_ADMIN")
        administradorRol.inicializarTablaRol()
        administradorRol.save(flush: true)

        Rol usuarioRol = new Rol("ROL_USUARIO")
        usuarioRol.inicializarTablaRol()
        usuarioRol.save(flush: true)

        Rol profRole = new Rol("ROL_PROF")
        profRole.inicializarTablaRol()
        profRole.save(flush: true)
            
        Servicio serv1 = new Servicio("2 veces por semana",8)
        serv1.inicializarTablaServ()
        serv1.save(flush: true)

        Servicio serv2 = new Servicio("3 veces por semana",12)
        serv2.inicializarTablaServ()
        serv2.save(flush: true)

        Servicio serv3 = new Servicio("Pase libre",30)
        serv3.inicializarTablaServ()
        serv3.save(flush: true)

        Tipousuario tipoUsuario1 = new Tipousuario("PENDIENTE","P")
        tipoUsuario1.inicializarTablaTipo()
        tipoUsuario1.save(flush: true)

        Tipousuario tipoUsuario2 = new Tipousuario("KIDS","K")
        tipoUsuario2.inicializarTablaTipo()
        tipoUsuario2.save(flush: true)

        Tipousuario tipoUsuario3 = new Tipousuario("CROSSFITERO","C")
        tipoUsuario3.inicializarTablaTipo()
        tipoUsuario3.save(flush: true)

        Tipousuario tipoUsuario4 = new Tipousuario("ATLETAS","AT")
        tipoUsuario4.inicializarTablaTipo()
        tipoUsuario4.save(flush: true)

        Tipousuario tipoUsuario5 = new Tipousuario("ADMIN","AD")
        tipoUsuario5.inicializarTablaTipo()
        tipoUsuario5.save(flush: true)

        Usuario usuarioPrueba = new Usuario("ni.co55@hotmail.com","12345678","Nico","Rodriguez","Masculinos",administradorRol,serv3,tipoUsuario5)
        usuarioPrueba.save(flush: true)
        
        administradorRol.agregarUsuario(usuarioPrueba)
        administradorRol.save(flush: true)
     	
    	
    }
    def destroy = {
    }
}
