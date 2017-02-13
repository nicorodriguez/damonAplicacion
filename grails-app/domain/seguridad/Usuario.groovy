package seguridad
import seguridad.Rol
import seguridad.Servicio
import sistema.Tipousuario
import sistema.Clase
import session.SessionManager
import java.text.SimpleDateFormat
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession
import grails.transaction.Transactional

class Usuario {

	String email
	String password
	String nombre
	String apellido
	String sexo
	String estado = 'p'
	Integer creditosActuales
	Date fechaVenc
	Rol rol
	Servicio servicio
	Tipousuario tipo
	static belongsTo = [Rol, Servicio, Tipousuario, Clase]
	// static belongsTo = [rol: Rol, servicio: Servicio, tipo: Tipousuario, clase: Clase]

	Usuario(String email1, String password1, String nombre1, String apellido1, String sexo1, Rol r, Servicio s, Tipousuario t){
		this()
		this.email = email1
		this.password = password1
		this.nombre = nombre1
		this.apellido = apellido1
		this.sexo = sexo1
		this.estado = 'p'
		this.fechaVenc = new Date()
		this.rol = r
		this.servicio = s
		this.tipo = t
		this.creditosActuales = s.cantidadcreditos
	}

	static mapping = {
		//nombre column: "nombre", sqlType: "varchar", length: 46
		rol lazy: false
		servicio lazy: false
		tipo lazy: false
		inscriptoclases cascade:"all,delete-orphan", lazy: false
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
	String getNumdiaactual(){
		Date actual = new Date()
		def formatoNumdiaactual = new SimpleDateFormat("u")
        String numda = formatoNumdiaactual.format(actual)
		return(numda)
	}
	def iniciarLunesAnt(){

        Date fechaAct = new Date()

        def formatoNumdia = new SimpleDateFormat("u")
        String numm = formatoNumdia.format(fechaAct)

        Integer numdia = numm.toInteger()

        if (numdia == 1){
        	// def formatoNumdiafecha = new SimpleDateFormat("dd")

	        // String numdf = formatoNumdiafecha.format(fechaAct)

			return(fechaAct)
        }
        else{
        	Integer cantV = numdia - 1

	        Date lunesAnt = fechaAct.minus(cantV)

			// def formatoNumdiafecha = new SimpleDateFormat("dd")

	  //       String numdf = formatoNumdiafecha.format(lunesAnt)

			return(lunesAnt)
        }
    }
    String getDiaFecha(Date ddd){
		def formatoDiaFecha = new SimpleDateFormat("EEEE - dd")
        String diafecha = formatoDiaFecha.format(ddd)
        // println(diafecha)
		return(diafecha)
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
	boolean esPrivilegiado(){
		def smgr = new SessionManager(request.session)
        def u = smgr.getCurrentUser()
		Rol r = u.getRol()
		String nombreR = r.getNombrerol()
		if (nombreR == "ROL_ADMIN"){
			return(true)
		}
		else{
			return(false)
		}
	}

	boolean setEstado(String est){
		try{
			// println(this)
			// println(est)
			int longitud = est.length()
			// println("Compruebo si el nuevo estado es longitud 1")

			if (longitud == 1){
				// println("Longitud correcta")

				this.estado = est
				// println("Se cambio el estado con exito")
				return(true)
			}
			else{
				// println("Longitud incorrecta")
				return(false)
			}
		}
		catch(Exception e){
			println("PROBLEMA")
			println(e)
			return(false)
		}
	}

	boolean setEstadoValido(){

		try{

			this.estado = 'v'
			println("Se cambio el estado a Valido con exito")
			return(true)

		}
		catch(Exception e){
			println("PROBLEMA")
			println(e)
			return(false)
		}
	}

	boolean setEstadoActivo(){

		try{
			this.estado = 'a'
			println("Se cambio el estado a Activo con exito")
			return(true)
		}
		catch(Exception e){
			println("PROBLEMA")
			println(e)
			return(false)
		}
	}

	def buscarInactivos(){
		def listaUsuariosAct = Usuario.findAllByEstado('a')
		def listaUsuariosVal = Usuario.findAllByEstado('v')


	}

	// import java.text.SimpleDateFormat;
 //    import java.util.*;
	// public static String compareDateTimes(Date date1, Date date2){
 //            if (date1.after(date2)) return "date1 is after date2";    

 //            if (date1.before(date2)) return "date1 is before date2";

 //            if (date1.equals(date2)) return "date1 is equal to date2";
 //    }

	//Tolerancia de 90 dias para pasar de activo a inactivo
	//Tolerancia de 30 dias para pasar de valido a inactivo
	//Date fechaAct = new Date()
	//Date tresMesesDesp = fechaAct + 90.days
	//1.year
	//30.minutes

	boolean setEstadoInactivo(){
		try{
			this.estado = 'i'
			println("Se cambio el estado a inactivo con exito")
			return(true)
		}
		catch(Exception e){
			println("PROBLEMA")
			println(e)
			return(false)
		}
	}

	boolean setRol(Rol s){
		try{
			this.rol = s
			return(true)
		}
		catch(Exception e){
			println("PROBLEMA")
			println(e)
			return(false)
		}
	}

	boolean setServicio(Servicio s){
		try{
			// println(this)
			// println(s)
			this.servicio = s
			// println("Se cambio el Servicio con Exito")
			return(true)
		}
		catch(Exception e){
			println("PROBLEMA")
			println(e)
			return(false)
		}
	}
	
	boolean setTipo(Tipousuario t){
		
		try{
			// println(this)
			// println(t)
			this.tipo = t
			// println("Se cambio el Tipo de Usuario con Exito")
			return(true)
		}
		catch(Exception e){
			println("PROBLEMA")
			println(e)
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

	Boolean resetarCreditos(Usuario usuarioPrivilegiado){
		Rol r = usuarioPrivilegiado.getRol()
		String nombreR = r.getNombrerol()
		if (nombreR == "ROL_ADMIN"){
			Integer creditosResetear = this.servicio.cantidadcreditos
			this.creditosActuales = creditosResetear
			Date fechaActual = new Date()
			this.fechaVencimientoCred = fechaActual + 30.days
			println("Se resetearon los creditos del usuario")
			return(true)
		}
		else{
			println("No tiene el rol necesario para resetear los creditos del usuario!")
			return(false)
		}
	}



}