package seguridad

class CalendarController {

    def index() {
    	println (session["usuario"].apellido)
    	render(view: 'index') 
	}
}
