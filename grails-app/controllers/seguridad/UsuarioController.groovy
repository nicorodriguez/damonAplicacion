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

    def login(){

    // Capturo datos de post de formulario
        def username =  request.getParameter("username")
        def password = request.getParameter("password")
        
        // Traigo un usuario de la base de datos
        Usuario user = Usuario.findByUsernameAndPassword( username , password )

        // Si el usuario existe, guardarlo en la sesion. Retornar el string Success
        if(user){
            def smgr = new SessionManager(request.session)
            def rol = Rol.findByUsuario(user)
            smgr.crearSesion(user, rol)

            /*
            smgr.nuevoCarrito()
            Carrito c = smgr.getCurrentCart()
            c.save(flush: true)
            c.inicializarListaPedidos()
            */

            //Busco Carrito en la Base  
            //Carrito carr = Carrito.findByUsuario(user)
            //println("Carrito: "+carr)

            //Carrito carr = Carrito.findByUsuarioAndEstado(user,"p")
            //println("Carrito: "+carr)
            
            /*
            if (carr){
                println("Se encontro un Carrito Creado")
                smgr.setCurrentCart(carr)
            }
            else{
                println("No se encontró Carrito Existente")
                //smgr.nuevoCarrito()
                //Carrito c = smgr.getCurrentCart()
                //Date f = new Date()
                //c.setFecha(f)
                //c.save(flush: true)
                //c.inicializarListaPedidos()
            }
            */
            
            render("Success")   
        }
        else{
            render("Fail")
        }

    }

    // Elimina la sesion actual.
    def logout() {
        def mySession = request.session
        def smgr = new SessionManager(mySession)
        smgr.eliminarSesion()
    }

    //Hay un usuario logeado?
    def isSessionActive(){
        def mySession = request.session
        def smgr = new SessionManager(mySession)

        // Retorna true o false como String
        render smgr.isActive()
    }

    def show(Usuario usuarioInstance) {
        respond usuarioInstance
    }

    def create() {
        respond new Usuario(params)
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
}
