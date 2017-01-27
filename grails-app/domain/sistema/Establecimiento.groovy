package sistema

class Establecimiento {

	String nombre
	Integer cantMax

	Establecimiento(String n, Integer c){
		this()
		this.nombre = n
		this.cantMax = c
	}

	static mapping = {
		//nombre column: "nombre", sqlType: "varchar", length: 46
		version false
	}

    static constraints = {
    	nombre nullable: false, blank: false, minSize: 1, maxSize: 50, unique: true
    	cantMax nullable: false, blank: false, minSize: 1, maxSize: 3
    }

    def setNombre(String s){
		this.nombre = s
	}

	def setCantMax(Integer a){
		this.cantMax = a
	}

}