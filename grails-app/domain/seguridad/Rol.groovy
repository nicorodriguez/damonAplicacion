package seguridad
import seguridad.Usuario

class Rol {

	String nombrerol
	static hasMany = [usuariosrol: Usuario]

	Rol(String nombre){
		this()
		this.nombrerol = nombre
	}

	static mapping = {
		//nombre column: "nombre", sqlType: "varchar", length: 46
		version false
	}

    static constraints = {
    	nombrerol nullable: false, blanck: false, unique: true
    }

	//Getters
	String getNombrerol(){
		return nombrerol
	}

	//Setters
	String setNombrerol(String s){
		this.nombrerol = s
	}

	def inicializarTablaRol(){
		this.usuariosrol = []
	}

	String agregarUsuario(Usuario u){
		this.usuariosrol << u
		return("true")
	}
}
