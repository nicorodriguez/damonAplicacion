package seguridad
import seguridad.Usuario

class Servicio {

	String nombreservicio
	Integer cantidadcreditos
	static hasMany = [usuariosserv: Usuario]

	Servicio(String nombre, Integer cant){
		this()
		this.nombreservicio = nombre
		this.cantidadcreditos = cant
	}

	static mapping = {
		//nombre column: "nombre", sqlType: "varchar", length: 46
		version false
	}

    static constraints = {
    	nombreservicio nullable: false, blank: false,  unique: true
    	cantidadcreditos nullable: false, blank: false,  unique: true
    }

    //Getters
	String getNombreservicio(){
		return nombreservicio
	}	
	Integer getCantidadcreditos(){
		return cantidadcreditos
	}

	//Setters
	String setNombreservicio(String s){
		this.nombreservicio = s
	}	
	Integer setCantidadcreditos(Integer s){
		this.cantidadcreditos = s
	}

	def inicializarTablaServ(){
		this.usuariosserv = []
	}
}
