package sistema

class Ejercicio {

	String nombre
	
	Ejercicio(String nombre1){
		this()
		this.nombre = nombre1
	}

	static mapping = {
		//nombre column: "nombre", sqlType: "varchar", length: 46
		
		version false
	}

    static constraints = {
    }
}
