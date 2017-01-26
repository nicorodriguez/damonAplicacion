import seguridad.*
import sistema.*
import grails.transaction.Transactional
import java.text.SimpleDateFormat

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

        Servicio serv4 = new Servicio("Profesor",0)
        serv4.inicializarTablaServ()
        serv4.save(flush: true)

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

        Usuario usuarioPrueba = new Usuario("ni.co55@hotmail.com","12345678","Nico","Rodriguez","Masculino",administradorRol,serv3,tipoUsuario5)
        usuarioPrueba.save(flush: true)

        Usuario profesor = new Usuario("jaja@hotmail.com","12345678","David","Sangali","Masculino",profRole,serv4,tipoUsuario5)
        profesor.save(flush: true)
        
        administradorRol.agregarUsuario(usuarioPrueba)
        administradorRol.save(flush: true)
     	
        String fecha1 = 'Jueves 26/01/2017 08:00'
        Date fechaDate1 = Date.parse( 'EEEE dd/MM/yyyy hh:mm', fecha1 )
        Clase clase1 = new Clase(fechaDate1,profesor,tipoUsuario3,30)
        clase1.inicializarTablaAnotados()
        clase1.save(flush: true)
        
        String fecha2 = 'Jueves 26/01/2017 08:00'
        Date fechaDate2 = Date.parse( 'EEEE dd/MM/yyyy hh:mm', fecha2 )
        Clase clase2 = new Clase(fechaDate2,profesor,tipoUsuario2,20)
        clase2.inicializarTablaAnotados()
        clase2.save(flush: true)

        String fecha3 = 'Martes 24/01/2017 09:00'
        Date fechaDate3 = Date.parse( 'EEEE dd/MM/yyyy hh:mm', fecha3 )
        Clase clase3 = new Clase(fechaDate3,profesor,tipoUsuario3,15)
        clase3.inicializarTablaAnotados()
        clase3.save(flush: true)

        String fecha4 = 'Miércoles 25/01/2017 08:00'
        Date fechaDate4 = Date.parse( 'EEEE dd/MM/yyyy hh:mm', fecha4 )
        Clase clase4 = new Clase(fechaDate4,profesor,tipoUsuario3,15)
        clase4.inicializarTablaAnotados()
        clase4.save(flush: true)

        String fecha5 = 'Viernes 27/01/2017 10:00'
        Date fechaDate5 = Date.parse( 'EEEE dd/MM/yyyy hh:mm', fecha5 )
        Clase clase5 = new Clase(fechaDate5,profesor,tipoUsuario3,15)
        clase5.inicializarTablaAnotados()
        clase5.save(flush: true)
    	
    }
    def destroy = {
    }
}
