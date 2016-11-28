package sistema
import seguridad.Usuario

class Tipousuario {

	String nombre
	String abreviatura
	static hasMany = [usuariostipo: Usuario]

	Tipousuario(String n, String a){
		this()
		this.nombre = n
		this.abreviatura = a
	}

	static mapping = {
		//nombre column: "nombre", sqlType: "varchar", length: 46
		version false
	}

    static constraints = {
    	nombre nullable: false, blank: false,  unique: true
    	abreviatura nullable: false, blank: false,  unique: true, minSize: 1, maxSize: 2
    }

    //Getters
    String getNombre(){
		return nombre
	}

	String getAbreviatura(){
		return abreviatura
	}

	//Setters
	String setNombre(String s){
		this.nombre = s
	}

	String setAbreviatura(String s){
		this.abreviatura = s
	}

	def inicializarTablaTipo(){
		this.usuariostipo = []
	}
}