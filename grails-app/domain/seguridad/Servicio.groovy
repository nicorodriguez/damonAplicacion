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
		usuariosserv lazy: false, cascade:"all,delete-orphan"
		version false
	}

    static constraints = {
    	nombreservicio nullable: false, blank: false,  unique: true
    	cantidadcreditos nullable: false, blank: false
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

	def nuevoServ(){
		String nombre = request.getParameter("nombre")
		String cantString = request.getParameter("cant")

		Integer cant = cantString.toInteger()

		Servicio serv1 = Servicio.findByNombreservicio(nombre)
		Servicio serv2 = Servicio.findByCantidadcreditos(cant)
		if ((serv1) || (serv2)){
			render("Ya existente el nombre o cantidad")
		}
		else{
			try{
				Servicio nuevoServicio = new Servicio(nombre,cant)
	        	nuevoServicio.inicializarTablaServ()
	        	nuevoServicio.save(flush: true)
				render("true")
			}
			catch(Exception e){
				println("PROBLEMA")
				println(e)
				render("false")
			}
		}
	}

	def eliminarServ(){
		String nombre = request.getParameter("nombre")
		
		Servicio serv1 = Servicio.findByNombreservicio(nombre)

		if (serv1){
			try{
	        	serv1.delete(flush: true)
				render("true")
			}
			catch(Exception e){
				println("PROBLEMA")
				println(e)
				render("false")
			}
		}
		else{
			println("Servicio Inexistente")
			render("inexistente")
		}
		
	}
}
