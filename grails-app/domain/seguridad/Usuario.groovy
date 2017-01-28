package seguridad
import seguridad.Rol
import seguridad.Servicio
import sistema.Tipousuario
import sistema.Clase
import session.SessionManager

class Usuario {

	String email
	String password
	String nombre
	String apellido
	String sexo
	String estado = 'p'
	Integer creditosActuales
	Rol rol
	Servicio servicio
	Tipousuario tipo
	static hasMany = [inscriptoclases: Clase]
	static belongsTo = [Rol, Servicio, Tipousuario, Clase]
	// static belongsTo = [rol: Rol, servicio: Servicio, tipo: Tipousuario]

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
		this.creditosActuales = s.cantidadcreditos
		this.inscriptoclases = []
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
	String setInscriptoClases(){
		this.inscriptoclases = []
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

	// def clasesDisponibles(){

 //        def smgr = new SessionManager(request.session)
        
 //        Usuario usuario = smgr.getCurrentUser()
 //        Rol rol = smgr.getCurrentRol() 
 //        String nombreRol = rol.getNombrerol()
 //        Tipousuario tipo = usuario.tipo
 //        def lista = []

 //        if ((nombreRol == "ROL_ADMIN") || (nombreRol == "ROL_PROF")){
 //            lista = Clase.getAll()
 //            return(lista)
 //        }
 //        else{
 //            if (nombreRol == "ROL_USUARIO"){
 //                lista = Clase.findAllByTipo(tipo)
 //                return(lista)
 //            }
 //        }
 //    }

	// Boolean setEstadoValido(Usuario u, String e){
	// 	int longitud = e.length()
	// 	println("Compruebo si el nuevo estado es longitud 1")

	// 	if (longitud == 1){
	// 		println("Longitud correcta")

	// 		Rol r = u.getRol()
	// 		String nombreR = r.getNombrerol()
	// 		if (nombreR == "ROL_ADMIN"){
	// 			this.estado = e
	// 			println("Se cambio el estado con exito")
	// 		}
	// 		else{
	// 			println("El usuario no tiene el rol requerido para cambiar el estado del usuario")
	// 			return false
	// 		}
	// 	}
	// 	else{
	// 		println("Longitud incorrecta")
	// 		return false
	// 	}
	// }

	// Boolean setEstadoActivo(Usuario u, String e){
	// 	int longitud = e.length()
	// 	println("Compruebo si el nuevo estado es longitud 1")

	// 	if (longitud == 1){
	// 		println("Longitud correcta")

	// 		Rol r = u.getRol()
	// 		String nombreR = r.getNombrerol()
	// 		if (nombreR == "ROL_ADMIN"){
	// 			this.estado = e
	// 			println("Se cambio el estado con exito")
	// 		}
	// 		else{
	// 			println("El usuario no tiene el rol requerido para cambiar el estado del usuario")
	// 			return false
	// 		}
	// 	}
	// 	else{
	// 		println("Longitud incorrecta")
	// 		return false
	// 	}
	// }

	// Boolean setEstadoInactivo(Usuario u, String e){
	// 	int longitud = e.length()
	// 	println("Compruebo si el nuevo estado es longitud 1")

	// 	if (longitud == 1){
	// 		println("Longitud correcta")

	// 		Rol r = u.getRol()
	// 		String nombreR = r.getNombrerol()
	// 		if (nombreR == "ROL_ADMIN"){
	// 			this.estado = e
	// 			println("Se cambio el estado con exito")
	// 		}
	// 		else{
	// 			println("El usuario no tiene el rol requerido para cambiar el estado del usuario")
	// 			return false
	// 		}
	// 	}
	// 	else{
	// 		println("Longitud incorrecta")
	// 		return false
	// 	}
	// }

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

	Boolean setServicio(Usuario usuarioPrivilegiado, Usuario usuarioACambiar, Servicio s){
		try{
			Rol r = usuarioPrivilegiado.getRol()
			String nombreR = r.getNombrerol()
			if (nombreR == "ROL_ADMIN"){
				if (usuarioACambiar.servicio != s){
					usuarioACambiar.servicio = s
					println("Se cambio el Servicio con Exito")
					return(true)
				}
				else{
					println("El Usuario ya tiene dicho servicio!")
					return(false)
				}
			}
			else{
				println("No tiene el rol necesario para cambiar el servicio!")
				return(false)
			}
		}
		catch(Exception e){
			println("PROBLEMA")
			println(e)
		}
	}
	
	Boolean setTipo(Usuario usuarioPrivilegiado, Usuario usuarioACambiar, Tipousuario t){
		Rol r = usuarioPrivilegiado.getRol()
		String nombreR = r.getNombrerol()
		if (nombreR == "ROL_ADMIN"){
			if (usuarioACambiar.tipo != t){
				usuarioACambiar.tipo = t
				println("Se cambio el Tipo de Usuario con Exito")
				return(true)
			}
			else{
				println("El Usuario ya tiene dicho tipo!")
				return(false)
			}
		}
		else{
			println("No tiene el rol necesario para cambiar el tipo de usuario!")
			return(false)
		}
	}

	Boolean hayCreditos(){
		if (this.creditosActuales > 0){
			println("Creditos distintos a cero!")
			println("Creditos Actuales: "+this.creditosActuales)
			return(true)
		}
		else{
			println("Creditos iguales a cero!")
			println("Creditos Actuales: "+this.creditosActuales)
			return(false)
		}

	}

	Boolean disminuirCreditos(){
		if (this.creditosActuales > 0){
			this.creditosActuales = this.creditosActuales - 1
			println("Se disminuyo los créditos correctamente!")
			println("Creditos Actuales: "+this.creditosActuales)
			return(true)
		}
		else{
			println("No se disminuyo los creditos porque son iguales a cero!")
			println("Creditos Actuales: "+this.creditosActuales)
			return(false)
		}
	}

	Boolean aumentarCreditos(){
		if ((this.creditosActuales < this.servicio.cantidadcreditos) && (this.creditosActuales >= 0)){
			this.creditosActuales = this.creditosActuales + 1
			println("Se aumento los creditos correctamente!")
			println("Creditos Actuales: "+this.creditosActuales)
			return(true)
		}
		else{
			println("No se aumento los créditos porque la cantidad actual es la cantidad maxima o menor que cero!")
			println("Creditos Actuales: "+this.creditosActuales)
			return(false)
		}
	}

	Boolean resetarCreditos(Usuario usuarioPrivilegiado, Usuario usuarioACambiar){
		Rol r = usuarioPrivilegiado.getRol()
		String nombreR = r.getNombrerol()
		if (nombreR == "ROL_ADMIN"){
			Integer creditosResetear = usuarioACambiar.servicio.cantidadcreditos
			usuarioACambiar.creditosActuales = creditosResetear
			println("Se resetearon los creditos del usuario")
			return(true)
		}
		else{
			println("No tiene el rol necesario para resetear los creditos del usuario!")
			return(false)
		}
	}

	boolean agregarUsuarioAInscriptos(Clase c){
		try{
			println("AgregarUsuarioALista - Se inicia el proceso")
			this.inscriptoclases << c
			println("AgregarUsuarioALista - Se agrego al usuario: "+c+" Satisfactoriamente")
			println(c)
			// this.save(flush: true)
			return(true)
		}
		catch(Exception e){
            println("PROBLEMA")
            println(e)

            return(false)
        }
	}


}