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

        Servicio serv5 = new Servicio("Admin",0)
        serv5.inicializarTablaServ()
        serv5.save(flush: true)

        Tipousuario tipoUsuario1 = new Tipousuario("PENDIENTE")
        tipoUsuario1.inicializarTablaTipo()
        tipoUsuario1.save(flush: true)

        Tipousuario tipoUsuario2 = new Tipousuario("KIDS")
        tipoUsuario2.inicializarTablaTipo()
        tipoUsuario2.save(flush: true)

        Tipousuario tipoUsuario3 = new Tipousuario("CROSSFITERO")
        tipoUsuario3.inicializarTablaTipo()
        tipoUsuario3.save(flush: true)

        Tipousuario tipoUsuario4 = new Tipousuario("ATLETAS")
        tipoUsuario4.inicializarTablaTipo()
        tipoUsuario4.save(flush: true)

        Tipousuario tipoUsuario5 = new Tipousuario("ADMIN")
        tipoUsuario5.inicializarTablaTipo()
        tipoUsuario5.save(flush: true)

        Tipousuario tipoUsuario6 = new Tipousuario("PROFESOR")
        tipoUsuario6.inicializarTablaTipo()
        tipoUsuario6.save(flush: true)

        Usuario usuarioPrueba = new Usuario("nico55@hotmail.com","12345678","Nico","Rodriguez","Masculino",administradorRol,serv5,tipoUsuario5)
        usuarioPrueba.save(flush: true)

        Usuario profesor = new Usuario("davids@hotmail.com","12345678","David","Sangali","Masculino",profRole,serv4,tipoUsuario6)
        profesor.save(flush: true)

        Usuario alumnoCross = new Usuario("lucasg@hotmail.com","12345678","Lucas","Galetti","Masculino",usuarioRol,serv1,tipoUsuario3)
        alumnoCross.save(flush: true)
        
        administradorRol.agregarUsuario(usuarioPrueba)
        administradorRol.save(flush: true)
        usuarioRol.agregarUsuario(alumnoCross)
        usuarioRol.save(flush: true)
        profRole.agregarUsuario(profesor)
        profRole.save(flush: true)
     	
        String fecha1 = 'Jueves 16/02/2017 08:00'
        Date fechaDate1 = Date.parse( 'EEEE dd/MM/yyyy HH:mm', fecha1 )
        Clase clase1 = new Clase(fechaDate1,profesor,tipoUsuario3,30)
        clase1.inicializarTablaAnotados()
        clase1.save(flush: true)
        
        String fecha2 = 'Jueves 16/02/2017 08:00'
        Date fechaDate2 = Date.parse( 'EEEE dd/MM/yyyy HH:mm', fecha2 )
        Clase clase2 = new Clase(fechaDate2,profesor,tipoUsuario2,20)
        clase2.inicializarTablaAnotados()
        clase2.save(flush: true)

        String fecha3 = 'Martes 14/02/2017 09:00'
        Date fechaDate3 = Date.parse( 'EEEE dd/MM/yyyy HH:mm', fecha3 )
        Clase clase3 = new Clase(fechaDate3,profesor,tipoUsuario3,15)
        clase3.inicializarTablaAnotados()
        clase3.save(flush: true)

        String fecha4 = 'Miércoles 15/02/2017 08:00'
        Date fechaDate4 = Date.parse( 'EEEE dd/MM/yyyy HH:mm', fecha4 )
        Clase clase4 = new Clase(fechaDate4,profesor,tipoUsuario3,15)
        clase4.inicializarTablaAnotados()
        clase4.save(flush: true)

        String fecha5 = 'Viernes 17/02/2017 10:00'
        Date fechaDate5 = Date.parse( 'EEEE dd/MM/yyyy HH:mm', fecha5 )
        Clase clase5 = new Clase(fechaDate5,profesor,tipoUsuario3,15)
        clase5.inicializarTablaAnotados()
        clase5.save(flush: true)

        String fecha6 = 'Viernes 17/02/2017 10:00'
        Date fechaDate6 = Date.parse( 'EEEE dd/MM/yyyy HH:mm', fecha6 )
        Clase clase6 = new Clase(fechaDate6,profesor,tipoUsuario2,15)
        clase6.inicializarTablaAnotados()
        clase6.save(flush: true)

        String fecha7 = 'Lunes 13/02/2017 15:00'
        Date fechaDate7 = Date.parse( 'EEEE dd/MM/yyyy HH:mm', fecha7 )
        Clase clase7 = new Clase(fechaDate7,profesor,tipoUsuario4,20)
        clase7.inicializarTablaAnotados()
        clase7.save(flush: true)

        String fecha8 = 'Sábado 18/02/2017 18:00'
        Date fechaDate8 = Date.parse( 'EEEE dd/MM/yyyy HH:mm', fecha8 )
        Clase clase8 = new Clase(fechaDate8,profesor,tipoUsuario4,20)
        clase8.inicializarTablaAnotados()
        clase8.save(flush: true)

        String fecha9 = 'Lunes 13/02/2017 15:00'
        Date fechaDate9 = Date.parse( 'EEEE dd/MM/yyyy HH:mm', fecha9 )
        Clase clase9 = new Clase(fechaDate9,profesor,tipoUsuario3,20)
        clase9.inicializarTablaAnotados()
        clase9.save(flush: true)
    	
    }
    def destroy = {
    }
}
