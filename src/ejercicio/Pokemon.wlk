import wollok.game.*

class Pokemon {
	var especie
	var hambre = 0

	method felicidad() = self.alegria() - hambre

	method alegria() = especie.alegria()

	method usarHabilidad() = especie.usarHabilidad(self)

	method disminuirHambre(cantidad) {
		hambre = 0.max(hambre - cantidad)
	}
	
	method aumentarHambre(cantidad) {
		hambre += cantidad
	}

	method comerBaya() {
		hambre -= 10
	}

	method evolucionar() {
		if (self.felicidad() > 50) {
			especie = especie.evolucion()
		} else {
			self.error("No puede evolucionar, necesita tener al menos 50 de felicidad y su felicidad es " + self.felicidad().toString())
		}
	}

	method image() = especie.image()

}

