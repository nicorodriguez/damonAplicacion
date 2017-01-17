package sistema
import seguridad.Usuario
import seguridad.Rol
import seguridad.Servicio
import sistema.Tipousuario

class Clase {

	Date fecha
	Date horario
	Usuario profe
	Tipousuario tipo
	Integer cantidadMax
	Integer cantidadActual = 0
	static hasMany = [anotados: Usuario]
	static belongsTo = Usuario

	Clase(Date fecha1, Date horario1, Usuario profe1, Tipousuario tipo1, Integer cantidadMax1){
		this()
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
	def getfechaDia(){
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
		println("cantidad anterior: " + this.cantidadActual)
		this.cantidadActual = this.cantidadActual + 1
		println("canidad siguiente: " + this.cantidadActual)
		return(this.cantidadActual)
	}

	boolean agregarUsuarioALista(Usuario u){
		try{
			this.anotados << u
			return(true)
		}
		catch(Exception e){
            println("PROBLEMA")
            println(e)

            return(false)
        }
	}
}
