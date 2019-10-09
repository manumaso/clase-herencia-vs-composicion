import pokemon.*

class Ataque {
	method nombre()
	method danio()
	method usar(objetivo) {
		objetivo.recibirDanio(self)	
	}
}

object lanzallamas inherits Ataque {
	override method nombre() = "Lanzallamas"
	override method danio() = 50
}

object chorroDeAgua inherits Ataque {
	override method nombre() = "Chorro De Agua"
	override method danio() = 50
}

object hojasNavaja inherits Ataque {
	override method nombre() = "Hojas navaja"
	override method danio() = 50
}

object transformacion inherits Ataque {
	override method nombre() = "Transformacion"
	override method danio() = 0
	override method usar(objetivo){
		ditto.transformarse(objetivo)
	}
}

object placaje inherits Ataque {
	override method nombre() = "Placaje"
	override method danio() = 10
}