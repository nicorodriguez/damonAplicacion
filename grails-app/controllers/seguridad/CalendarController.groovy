package seguridad
import seguridad.Usuario
import seguridad.Rol
import seguridad.Servicio
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession
import grails.transaction.Transactional
import session.SessionManager

class CalendarController {

    def index() {
    	def smgr = new SessionManager(request.session)
    	def u = smgr.getCurrentUser()
    	if (u){
    		render(view: 'index')
    	}
    	else{
            redirect(controller: "login" , action:"index")
    		//redirect(url: "http://localhost:8080/damonAplicacion/")
    	}
	}

    def misDatos(){
        redirect(controller: "usuario" , action:"misDatos")
    }

    def formatHora(){
        Date a = new Date()
        println(a)

        //funciona para pasar un string a date, los parametros son: Date.parse(forma del string, variable string)
        //Date date = Date.parse( 'dd-MMM-yyyy', a )

        println()
    }



    def crearClase(){

    }
}
