package sistema
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
import java.util.*
import groovy.time.TimeCategory

class Clase {

	Date fechaHorario
	Usuario profe
	Tipousuario tipo
	Integer cantidadMax
	Integer cantidadActual = 0
	static hasMany = [anotados: Usuario]

	Clase(Date fechaHorario1, Usuario profe1, Tipousuario tipo1, Integer cantidadMax1){
		this()
		this.fechaHorario = fechaHorario1
		this.profe = profe1
		this.tipo = tipo1
		this.cantidadMax = cantidadMax1
		this.cantidadActual = 0
	}

	static mapping = {
		//nombre column: "nombre", sqlType: "varchar", length: 46
		profe cascade:"all,delete-orphan"
		anotados lazy: false
		version false
	}

	// cascade:"all,delete-orphan"

    static constraints = {
    	fechaHorario nullable: false, blank: false, maxSize: 50
    	profe nullable: true, blank: false, maxSize: 50
    	tipo nullable: false, blank: false, maxSize: 50
    	cantidadMax nullable: false, blank: false, minSize: 1, maxSize: 50
    }

    def inicializarTablaAnotados(){
		this.anotados = []
	}

	def getProf(){
		emailProf = this.profe
		Usuario prof = Usuario.findByEmail(emailProf)
		return(prof)
	}

	String getDia(){
		def formatoDia = new SimpleDateFormat("EEEE")
        String diaa = formatoDia.format(this.fechaHorario)
        // println(diaa)
		return(diaa)
	}

	String getDiaFecha(){
		def formatoDiaFecha = new SimpleDateFormat("EEEE - dd")
        String diafecha = formatoDiaFecha.format(this.fechaHorario)
        // println(diafecha)
		return(diafecha)
	}

	String getFecha(){
		def formatoFecha = new SimpleDateFormat("dd/MM/yyyy")
        String fechaa = formatoFecha.format(this.fechaHorario)
        // println(fechaa)
		return(fechaa)
	}

	String getHora(){
		def formatoHora = new SimpleDateFormat("HH:mm")
        String horaa = formatoHora.format(this.fechaHorario)
        // println(horaa)
		return(horaa)

	}

	String getNumdiafecha(){
		def formatoNumdiafecha = new SimpleDateFormat("dd")
        String numdf = formatoNumdiafecha.format(this.fechaHorario)
        // println(horaa)
		return(numdf)
	}

	String getNumdia(){
		def formatoNumdia = new SimpleDateFormat("u")
        String numm = formatoNumdia.format(this.fechaHorario)
        // println(horaa)
		return(numm)
	}

	boolean hayLugar(){
		if (this.cantidadActual < this.cantidadMax){
			return(true)
		}
		else{
			return(false)
		}
	}

	boolean verificoTiempo(){
		Date fechaAct = new Date()
		println("fechaAct: "+fechaAct)

		// def formatocambiar = new SimpleDateFormat("dd/MM/yyyy - hh:mm")
		// def fechacambiar = formatocambiar.format(this.fechaHorario)

		use(TimeCategory){
			def treintaMin = this.fechaHorario - 30.minutes
			println(treintaMin)

			if ((fechaAct.equals(treintaMin)) || (fechaAct.before(treintaMin))){
				println("Fecha y Hora Valida")
				return(true)
			}
			else{
				println("Fecha y Hora No Valida")
				return(false)
			}
		}
	}


	int aumentarCapActual(){
		println("AumentarCapActual -> cantidad anterior: " + this.cantidadActual)
		this.cantidadActual = this.cantidadActual + 1
		println("AumentarCapActual -> cantidad siguiente: " + this.cantidadActual)
		return(this.cantidadActual)
	}

	int disminuirCapActual(){
		println("DisminuirCapActual -> cantidad anterior: " + this.cantidadActual)
		this.cantidadActual = this.cantidadActual - 1
		println("DisminuirCapActual -> cantidad siguiente: " + this.cantidadActual)
		return(this.cantidadActual)
	}

	int calcularCapActual(){
		println("CalcularCapActual -> cantidad: " + this.cantidadActual)
		this.cantidadActual = this.anotados.size()
		println("CalcularCapActual -> cantidad nueva: " + this.cantidadActual)
		return(this.cantidadActual)
	}

	boolean agregarUsuarioALista(Usuario u){
		try{
			println("AgregarUsuarioALista - Se inicia el proceso")
			// this.anotados.add(u)

			this.anotados << u

			// this.addToAnotados(u).save(flush: true)
			println("AgregarUsuarioALista - Se agrego al usuario: "+u.nombre+" Satisfactoriamente")
			println(this.anotados)
			// return(lista)
			// this.save(flush: true)
			return(true)
		}
		catch(Exception e){
            println("PROBLEMA")
            println(e)

            return(false)
        }
	}
	// @Transactional

	boolean eliminarUsuarioDeLista(Usuario u){
		try{
			println("EliminarUsuarioDeLista - Se inicia el proceso")
			Usuario user = Usuario.get(u.id)

			println("EliminarUsuarioDeLista - "+this.anotados)

			def lista = []
			// this.anotados.remove(u)
			// lista = this.anotados - u
			// this.anotados = lista
			// u.inscriptoclases.remove(c)
			// this.removeFromAnotados(u)
			// this.anotados = []
			println("Usuario: "+ user)
			boolean b
			b = this.anotados.contains(user)
			if (b){
				println("entre")
				this.anotados.removeElement(user)
			}

			println("EliminarUsuarioDeLista - "+this.anotados)
			// u.discard()
			

			// this.anotados -= u

			// this.save(flush: true)
			// println(this.anotados)

			Integer cantAct = this.calcularCapActual()
			println("Nueva Cantidad Actual de Clase = " + cantAct)
			// u.eliminarUsuarioDeInscriptos(this)
			// this.anotados.remove{ anotados -> anotados.usuario.email == emailUser
			// }
			// this.anotados.find{it.email == emailUser}.each { it.delete(flush:true, failOnError:true) }
			// DomainClass.findAll().each { it.delete(flush:true, failOnError:true) }
			// this.anotados.executeUpdate("delete Usuario where email = (:em)",
   			 //               [em:emailUser])
			// this.anotados.save(flush: true)
			// this.saveOrUpdate()
			this.save(flush: true, failOnError: true)
			
			println("EliminarUsuarioDeLista - Se elimino al usuario: "+u.nombre+" Satisfactoriamente")
			return(true)
		}
		catch(Exception e){
            println("PROBLEMA")
            println(e)

            return(false)
        }
	}


	def estaAnotado(Usuario u){

		boolean a = false
		a = this.anotados.contains(u)

		if (a){
			return(true)
		}

		return(false)
	}

	// Pedido.executeUpdate("delete Pedido where cantidad = (:cant) and producto = (:productoId) and carrito = (:carritoId)",
 // //                [cant:ped.cantidad, productoId: ped.producto, carritoId: ped.carrito])
    
    
 // //    c.pedidos.removeAll{ pedidos-> 
 // //        pedidos.producto.id == id
 // //    }
}
