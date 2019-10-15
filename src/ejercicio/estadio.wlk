import game.juego.*
import game.AnimatedSprite.*

object estadio {

	var property temperatura = 10
	var clima = regular

	method aumentarTemperatura(grados) {
		temperatura += grados
		juego.temperaturaSubio(self.sensacionTermica())
	}

	method sensacionTermica() = clima.sensacionTermica(temperatura)

	method empezaALlover() {
		clima = lluvioso
		juego.seLargoALlover()
	}

	method secarse() {
		clima = soleado
	}

	method lloviendo() = clima.lloviendo()
	method soleado() = clima.soleado()
	
	method image() = clima.image()
}

class Clima {
	method lloviendo()
	method soleado() = !self.lloviendo()
	method sensacionTermica(temperatura) = temperatura
}

object lluvioso inherits Clima {
	const sprite = new AnimatedSprite(name="danza lluvia/lluvia_estado_", imageExtension="png", quantityOfFrames=7)
	method image() = sprite.image()
	override method lloviendo() = true
	override method sensacionTermica(temperatura) = super(temperatura) / 2
}

object regular inherits Clima {
	method image() = "empty.png"
	override method lloviendo() = false
}

object soleado inherits Clima {
	const sprite = new AnimatedSprite(name="dia soleado/sol_", imageExtension="png", quantityOfFrames=20)
	method image() = sprite.image()
	override method lloviendo() = false
}