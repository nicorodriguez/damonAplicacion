package seguridad
import seguridad.Usuario
import seguridad.Rol
import session.SessionManager
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UsuarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Usuario.list(params), model:[usuarioInstanceCount: Usuario.count()]
    }

    def devolverRol(){  // $.post("usuario/devolverRol").done(function (variable){} );
        def smgr = new SessionManager(request.session)
        Rol r = smgr.getCurrentRol()
        String nombreRol = r.getNombrerol()
        //return nombreRol
        render(nombreRol)   //Probando a ver si me devuelve el 
    }

    def show(Usuario usuarioInstance) {
        respond usuarioInstance
    }

    def create() {
        respond new Usuario(params)
    }

    def misDatos(){
        render(view: 'show')
    }

    @Transactional
    def save(Usuario usuarioInstance) {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view:'create'
            return
        }

        usuarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect usuarioInstance
            }
            '*' { respond usuarioInstance, [status: CREATED] }
        }
    }

    def edit(Usuario usuarioInstance) {
        respond usuarioInstance
    }

    @Transactional
    def update(Usuario usuarioInstance) {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view:'edit'
            return
        }

        usuarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect usuarioInstance
            }
            '*'{ respond usuarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Usuario usuarioInstance) {

        if (usuarioInstance == null) {
            notFound()
            return
        }

        usuarioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    // def lista() {
    //     params.max = Math.min(params.max ? params.int('max') : 10, 100)
    //     [usuarioInstanceList: Usuario.list(params), usuarioInstanceTotal: Usuario.count()]
    // }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 5, 100)
 
        def usuarioList = Usuario.createCriteria().list (params) {
            if ( params.query ) {
                ilike("email", "%${params.query}%")
            }
        }
 
        [usuarioInstanceList: usuarioList, usuarioInstanceTotal: usuarioList.totalCount]
    }


//     <fieldset class="form">
//     <g:form action="list" method="GET">
//         <div class="fieldcontain">
//             <label for="query">Search for tasks:</label>
//             <g:textField name="query" value="${params.query}"/>
//         </div>
//     </g:form>
// </fieldset>
}
