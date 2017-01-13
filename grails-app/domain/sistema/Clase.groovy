package sistema
import seguridad.Usuario
import seguridad.Rol
import seguridad.Servicio
import sistema.Tipousuario

class Clase {

	String nombre
	Date fecha
	Date horario
	Usuario profe
	Tipousuario tipo
	Integer cantidadMax
	Integer cantidadActual

	Clase(String nombre1, Date fecha1, Date horario1, Usuario profe1, Tipousuario tipo1){
		this()
		this.nombre = nombre1
		this.fecha = fecha1
		this.horario = horario1
		this.profe = profe1
		this.tipo = tipo1
	}

	static mapping = {
		//nombre column: "nombre", sqlType: "varchar", length: 46
		
		version false
	}

    static constraints = {
    }
}
