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

class ProfviewController{

	def index(){
		def smgr = new SessionManager(request.session)
    	def u = smgr.getCurrentUser()
    	if (u){
    		def rol = u.getRol()
    		String nombreRol = rol.getNombrerol()
    		if (nombreRol == "ROL_PROF"){
    			render(view: 'index')
    		}
    		else{
        		smgr.eliminarSesion()
    			redirect(controller: "login" , action:"ver")
    		}
    	}
    	else{
            redirect(controller: "login" , action:"ver")
    	}
	}

	def ver(){
        render(view: 'index')
    }
    
}