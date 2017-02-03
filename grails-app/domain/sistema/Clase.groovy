package sistema
import session.SessionManager
import seguridad.Usuario
import seguridad.Rol
import seguridad.Servicio
import sistema.Tipousuario
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession
import grails.transaction.Transactional
import java.text.SimpleDateFormat

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
		anotados cascade:"all,delete-orphan", lazy: false
		version false
	}

    static constraints = {
    	profe nullable: false, blank: false, maxSize: 50
    	tipo nullable: false, blank: false, maxSize: 50
    	cantidadMax nullable: false, blank: false, minSize: 1, maxSize: 50
    }

    def inicializarTablaAnotados(){
		this.anotados = []
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
		def formatoHora = new SimpleDateFormat("hh:mm")
        String horaa = formatoHora.format(this.fechaHorario)
        // println(horaa)
		return(horaa)

	}

	boolean hayLugar(){
		if (this.cantidadActual < this.cantidadMax){
			return(true)
		}
		else{
			return(false)
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
			this.anotados << u
			println("AgregarUsuarioALista - Se agrego al usuario: "+u.nombre+" Satisfactoriamente")
			println(anotados)
			// this.save(flush: true)
			return(true)
		}
		catch(Exception e){
            println("PROBLEMA")
            println(e)

            return(false)
        }
	}


	boolean eliminarUsuarioDeLista(Usuario u){
		try{
			println("EliminarUsuarioDeLista - Se inicia el proceso")
			String emailUser = u.email
			println(this.anotados)
			// this.anotados.remove(u)
			this.removeFromAnotados(u);
			u.eliminarUsuarioDeInscriptos(this)
			// this.anotados.remove{ anotados -> anotados.usuario.email == emailUser
			// }
			this.anotados.find{it.email == emailUser}.each { it.delete(flush:true, failOnError:true) }
			// DomainClass.findAll().each { it.delete(flush:true, failOnError:true) }
			// this.anotados.executeUpdate("delete Usuario where email = (:em)",
   			 //               [em:emailUser])
			// this.save(flush: true)
			println(this.anotados)
			println("EliminarUsuarioDeLista - Se elimino al usuario: "+u.nombre+" Satisfactoriamente")
			return(true)
		}
		catch(Exception e){
            println("PROBLEMA")
            println(e)

            return(false)
        }
	}

	
	
	// Pedido.executeUpdate("delete Pedido where cantidad = (:cant) and producto = (:productoId) and carrito = (:carritoId)",
 //                [cant:ped.cantidad, productoId: ped.producto, carritoId: ped.carrito])
    
    
 //    c.pedidos.removeAll{ pedidos-> 
 //        pedidos.producto.id == id
 //    }
}
