package sistema

class Comentario {

	Date fecha
	String titulo
	String descripcion

	Comentario(String t, String d){
		this()
		this.fecha = new Date()
		this.titulo = t
		this.descripcion = d
	}

    static mapping = {
		//nombre column: "nombre", sqlType: "varchar", length: 46
		version false
	}

	static constraints = {
		titulo nullable: false, blank: false, maxSize: 40
		descripcion nullable: false, blank: false, maxSize: 250
		fecha nullable: false, blank: false
	}

	String getTitulo(){
		return titulo
	}
	String getDescripcion(){
		return descripcion
	}
	Date getFecha(){
		return fecha
	}

	String setTitulo(String s){
		this.titulo = s
	}
	String setDescripcion(String s){
		this.descripcion = s
	}
	Date setFecha(Date d){
		this.fecha = d
	}


}
