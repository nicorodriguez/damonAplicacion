package sistema
import seguridad.Usuario
import seguridad.Rol
import seguridad.Servicio
import sistema.Clase
import sistema.Tipousuario
import sistema.Establecimiento
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession
import session.SessionManager
import java.text.SimpleDateFormat
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ClaseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Clase.list(params), model:[claseInstanceCount: Clase.count()]
    }

    def show(Clase claseInstance) {
        respond claseInstance
    }

    def create() {
        respond new Clase(params)
    }

    @Transactional
    def save(Clase claseInstance) {
        if (claseInstance == null) {
            notFound()
            return
        }

        if (claseInstance.hasErrors()) {
            respond claseInstance.errors, view:'create'
            return
        }

        claseInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'clase.label', default: 'Clase'), claseInstance.id])
                redirect claseInstance
            }
            '*' { respond claseInstance, [status: CREATED] }
        }
    }

    def edit(Clase claseInstance) {
        respond claseInstance
    }

    @Transactional
    def update(Clase claseInstance) {
        if (claseInstance == null) {
            notFound()
            return
        }

        if (claseInstance.hasErrors()) {
            respond claseInstance.errors, view:'edit'
            return
        }

        claseInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Clase.label', default: 'Clase'), claseInstance.id])
                redirect claseInstance
            }
            '*'{ respond claseInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Clase claseInstance) {

        if (claseInstance == null) {
            notFound()
            return
        }

        claseInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Clase.label', default: 'Clase'), claseInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'clase.label', default: 'Clase'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }



}
