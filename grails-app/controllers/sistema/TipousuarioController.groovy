package sistema



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TipousuarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Tipousuario.list(params), model:[tipousuarioInstanceCount: Tipousuario.count()]
    }

    def show(Tipousuario tipousuarioInstance) {
        respond tipousuarioInstance
    }

    def create() {
        respond new Tipousuario(params)
    }

    @Transactional
    def save(Tipousuario tipousuarioInstance) {
        if (tipousuarioInstance == null) {
            notFound()
            return
        }

        if (tipousuarioInstance.hasErrors()) {
            respond tipousuarioInstance.errors, view:'create'
            return
        }

        tipousuarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipousuario.label', default: 'Tipousuario'), tipousuarioInstance.id])
                redirect tipousuarioInstance
            }
            '*' { respond tipousuarioInstance, [status: CREATED] }
        }
    }

    def edit(Tipousuario tipousuarioInstance) {
        respond tipousuarioInstance
    }

    @Transactional
    def update(Tipousuario tipousuarioInstance) {
        if (tipousuarioInstance == null) {
            notFound()
            return
        }

        if (tipousuarioInstance.hasErrors()) {
            respond tipousuarioInstance.errors, view:'edit'
            return
        }

        tipousuarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Tipousuario.label', default: 'Tipousuario'), tipousuarioInstance.id])
                redirect tipousuarioInstance
            }
            '*'{ respond tipousuarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Tipousuario tipousuarioInstance) {

        if (tipousuarioInstance == null) {
            notFound()
            return
        }

        tipousuarioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Tipousuario.label', default: 'Tipousuario'), tipousuarioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipousuario.label', default: 'Tipousuario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
