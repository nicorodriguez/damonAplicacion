package seguridad



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ServicioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Servicio.list(params), model:[servicioInstanceCount: Servicio.count()]
    }

    def show(Servicio servicioInstance) {
        respond servicioInstance
    }

    def create() {
        respond new Servicio(params)
    }

    @Transactional
    def save(Servicio servicioInstance) {
        if (servicioInstance == null) {
            notFound()
            return
        }

        if (servicioInstance.hasErrors()) {
            respond servicioInstance.errors, view:'create'
            return
        }

        servicioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'servicio.label', default: 'Servicio'), servicioInstance.id])
                redirect servicioInstance
            }
            '*' { respond servicioInstance, [status: CREATED] }
        }
    }

    def edit(Servicio servicioInstance) {
        respond servicioInstance
    }

    @Transactional
    def update(Servicio servicioInstance) {
        if (servicioInstance == null) {
            notFound()
            return
        }

        if (servicioInstance.hasErrors()) {
            respond servicioInstance.errors, view:'edit'
            return
        }

        servicioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Servicio.label', default: 'Servicio'), servicioInstance.id])
                redirect servicioInstance
            }
            '*'{ respond servicioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Servicio servicioInstance) {

        if (servicioInstance == null) {
            notFound()
            return
        }

        servicioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Servicio.label', default: 'Servicio'), servicioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicio.label', default: 'Servicio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
