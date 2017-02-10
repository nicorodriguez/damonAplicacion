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

// def busquedaUsuario(){
//         def listaFiltrada = Usuario.createCriteria().list(params) {
//             if(params.parametro){
//                 ilike("email", "%${params.parametro}%")
//             }
        
//         }
//         if(!listaFiltrada){
//             flash.message = "El usuario con email: ${params.parametro} no existe"
//         }
//         render view:"index", model:[listaFiltrada:listaFiltrada]
//     }


            // <h1>Torneos</h1>
            // <g:if test="${flash.message}">
            //     <div class="message" role="status">${flash.message}</div>
            // </g:if>
            // <g:form action="busquedaTorneo" method="GET" style="padding: 1em; border-radius: 0.6em; margin: 2em 2em 1em; width: 90%; border: 0.2em solid rgb(238, 238, 238); height: 2em;">
            //     <fieldset class="form" style="left: 7em; top: -0.75em;">
            //         <div>
            //             <g:textField name="parametro" placeholder="Buscá un torneo..." maxlength="30" value="${params.parametro }" style="width: 52%;"/>
            //         </div>
            //     </fieldset>
            //     <g:submitButton name="buscar" class="save" value="Buscar" style="position: relative; left: 37em; top: -3.65em;" />
                
            // </g:form>
            
            // <table>
            //     <thead>
            //         <tr>
                    
            //             <g:sortableColumn property="nombre" title="${message(code: 'torneo.nombre.label', default: 'Torneo')}" />
                    
            //             <g:sortableColumn property="fechaInicio" title="${message(code: 'torneo.fechaInicio.label', default: 'Fecha de inicio')}" />
                    
            //             <g:sortableColumn property="fechaLimite" title="${message(code: 'torneo.fechaLimite.label', default: 'Límite de inscripción')}" />
                    
            //             <g:sortableColumn property="nMaxEquipos" title="${message(code: 'torneo.usuario.label', default: 'Creador')}" />
                                    
            //         </tr>
            //     </thead>
            //     <tbody>
            //     <g:if test="${!listaFiltrada }">
            //         <g:set var="listaFiltrada" value="${Torneo.list()}"></g:set>
            //     </g:if>
            //     <g:each in="${listaFiltrada}" status="i" var="torneoInstance">
            //         <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    
            //             <td><g:link action="show" id="${torneoInstance.id}">${fieldValue(bean: torneoInstance, field: "nombre")}</g:link></td>
                    
            //             <td><g:formatDate format="dd - MMM - yyyy" date="${torneoInstance.fechaInicio}" /></td>
                    
            //             <td><g:formatDate format="dd - MMM - yyyy" date="${torneoInstance.fechaLimite}" /></td>
                    
            //             <td>${fieldValue(bean: torneoInstance, field: "usuario")}</td>

                    
            //         </tr>
            //     </g:each>
            //     </tbody>
            // </table>
}
