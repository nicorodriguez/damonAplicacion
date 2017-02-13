package sistema
import seguridad.Usuario
import sistema.Clase

class Tipousuario {

	String nombre
	static hasMany = [usuariostipo: Usuario]
	// static belongsTo = Usuario

	Tipousuario(String n){
		this()
		this.nombre = n
	}

	static mapping = {
		//nombre column: "nombre", sqlType: "varchar", length: 46
		version false
	}

    static constraints = {
    	nombre nullable: false, blank: false,  unique: true
    }

    //Getters
    String getNombre(){
		return nombre
	}

	//Setters
	String setNombre(String s){
		this.nombre = s
	}

	def inicializarTablaTipo(){
		this.usuariostipo = []
	}
}