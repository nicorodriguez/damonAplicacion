package seguridad
import seguridad.Rol
import seguridad.Servicio

class Usuario {

	String email
	String password
	String nombre
	String apellido
	String estado = 'p'
	Rol rol
	Servicio servicio
	static belongsTo = [rol: Rol, servicio: Servicio]

//Cambiar los constructores por setters y getters solamente
//Inicializar las listas rol y servicio del Usuario, y añadir setters y getters (Controlar que siempre haya un elemento)

	Usuario(String email1, String password1, String nombre1, String apellido1, Rol r, Servicio s){
		this()
		this.email = email1
		this.password = password1
		this.nombre = nombre1
		this.apellido = apellido1
		this.estado = 'p'
		this.rol = r
		this.servicio = s
	}

	static mapping = {
		//nombre column: "nombre", sqlType: "varchar", length: 46
		rol lazy: false
		servicio lazy: false
		version false
	}

	static constraints = {
		email nullable: false, blank: false, maxSize: 45, unique: true, email: true
		nombre nullable: false, blank: false, maxSize: 45
		apellido nullable: false, blank: false, maxSize: 45
		password nullable: false, blank: false,  minSize: 6, maxSize: 18
		estado nullable: false, blank: false, minSize: 1, maxSize: 1
		rol nullable: false
		servicio nullable: false
	}

	// Defino los seters y los geters solo porque la clase Session Manager los necesita.

	//Getters
	String getEmail(){
		return email
	}	
	String getNombre(){
		return nombre
	}
	String getApellido(){
		return apellido
	}
	String getPassword(){
		return password
	}
	Rol getRol(){
		return rol
	}

	//Setters
	String setEmail(String s){
		this.email = s
	}	
	String setNombre(String s){
		this.nombre = s
	}	
	String setApellido(String s){
		this.apellido = s
	}
	String setPassword(String s){
		this.password = s
	}
	String setRol(Rol s){
		try{
			this.rol = s
			return("true")
		}
		catch(Exception e){
			println("PROBLEMA")
			println(e)
		}
	}
	String setServicio(Servicio s){
		try{
			this.servicio = s
			return("true")
		}
		catch(Exception e){
			println("PROBLEMA")
			println(e)
		}
	}


}