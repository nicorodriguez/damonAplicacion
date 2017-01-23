package sistema
import seguridad.Usuario
import seguridad.Rol
import seguridad.Servicio
import sistema.Tipousuario

class Clase {

	Date dia
	Date fecha
	Date horario
	Usuario profe
	Tipousuario tipo
	Integer cantidadMax
	Integer cantidadActual = 0
	static hasMany = [anotados: Usuario]
	static belongsTo = Usuario

	Clase(Date dia1, Date fecha1, Date horario1, Usuario profe1, Tipousuario tipo1, Integer cantidadMax1){
		this()
		this.dia = dia1
		this.fecha = fecha1
		this.horario = horario1
		this.profe = profe1
		this.tipo = tipo1
		this.cantidadMax = cantidadMax1
		this.cantidadActual = 0
	}

	static mapping = {
		//nombre column: "nombre", sqlType: "varchar", length: 46
		anotados lazy: false
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

	//Obtener el día de la fecha de la clase
	def getDia(){
		return(this.dia)
	}

	def getFecha(){
		return(this.fecha)
	}

	boolean hayLugar(){
		if (this.cantidadActual < this.cantidadMax){
			return(true);
		}
		else{
			return(false);
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

	boolean agregarUsuarioALista(Usuario u){
		try{
			println("AgregarUsuarioALista - Se inicia el proceso")
			this.anotados << u
			println("AgregarUsuarioALista - Se agrego al usuario: "+u.nombre+" Satisfactoriamente")
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
			this.anotados.removeAll{ anotados -> anotados.usuario.email == emailUser
			}
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
