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
            redirect  (controller: "login" , action:"index")
    		//redirect(url: "http://localhost:8080/damonAplicacion/")
    	}
	}
}
