package seguridad
import seguridad.Rol
import seguridad.Servicio
import sistema.Tipousuario
import sistema.Clase

class Usuario {

	String email
	String password
	String nombre
	String apellido
	String sexo
	String estado = 'p'
	Rol rol
	Servicio servicio
	Tipousuario tipo
	static belongsTo = [rol: Rol, servicio: Servicio, tipo: Tipousuario]
	static hasMany = [inscriptoclases: Clase]

	Usuario(String email1, String password1, String nombre1, String apellido1, String sexo1, Rol r, Servicio s, Tipousuario t){
		this()
		this.email = email1
		this.password = password1
		this.nombre = nombre1
		this.apellido = apellido1
		this.sexo = sexo1
		this.estado = 'p'
		this.rol = r
		this.servicio = s
		this.tipo = t
	}

	static mapping = {
		//nombre column: "nombre", sqlType: "varchar", length: 46
		rol lazy: false
		servicio lazy: false
		tipo lazy: false
		inscriptoclases lazy: false
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
		tipo nullable: false
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
	String getSexo(){
		return sexo
	}
	String getPassword(){
		return password
	}
	Rol getRol(){
		return rol
	}
	Servicio getServ(){
		return servicio
	}
	Tipousuario getTipo(){
		return tipo
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
	String setSexo(String s){
		this.sexo = s
	}
	String setPassword(String s){
		this.password = s
	}
	Boolean setEstado(Usuario u, String e){
		int longitud = e.length()
		println("Compruebo si el nuevo estado es longitud 1")

		if (longitud == 1){
			println("Longitud correcta")

			Rol r = u.getRol()
			String nombreR = r.getNombrerol()
			if (nombreR == "ROL_ADMIN"){
				this.estado = e
				println("Se cambio el estado con exito")
			}
			else{
				println("El usuario no tiene el rol requerido para cambiar el estado del usuario")
				return false
			}
		}
		else{
			println("Longitud incorrecta")
			return false
		}
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
	Boolean setTipo(Usuario u, Tipousuario t){
		Rol r = u.getRol()
		String nombreR = r.getNombrerol()
		if (nombreR == "ROL_ADMIN"){
			this.tipo = t
			println("Se cambio el Tipo de Usuario con Exito")
			return true
		}
		else{
			println("No tiene el rol necesario!")
			return false
		}
	}



}