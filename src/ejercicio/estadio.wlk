import game.juego.*
import game.AnimatedSprite.*

object estadio {

	var property temperatura = 0
	var property clima = regular

	method aumentarTemperatura(grados) {
		temperatura += grados
		juego.temperaturaSubio(self.sensacionTermica())
	}

	method sensacionTermica() = clima.sensacionTermica(temperatura)

	method empezaALlover() {
		clima.llover(self)
	}

	method secarse() {
		clima.salirSol(self)
	}

	method lloviendo() = clima.lloviendo()

	method soleado() = clima.soleado()

	method image() = clima.image()

}

class Clima {

	method lloviendo()

	method soleado() = !self.lloviendo()

	method sensacionTermica(temperatura) = temperatura

	method llover(estadio) {
		juego.seLargoALlover()
		estadio.clima(lluvioso)
	}

	method salirSol(estadio) {
		juego.dejoDeLlover()
		estadio.clima(soleado)
	}

}

object lluvioso inherits Clima {

	const sprite = new AnimatedSprite(name = { "danza lluvia/lluvia_estado_" }, imageExtension = "png", quantityOfFrames = 7)

	method image() = sprite.image()

	override method lloviendo() = true

	override method sensacionTermica(temperatura) = super(temperatura) / 2

	override method llover(_estadio) {
	}

}

object regular inherits Clima {

	method image() = "empty.png"

	override method lloviendo() = false

}

object soleado inherits Clima {

	const sprite = new AnimatedSprite(name = { "dia soleado/sol_" }, imageExtension = "png", quantityOfFrames = 20)

	method image() = sprite.image()

	override method lloviendo() = false

	override method salirSol(_estadio) {
	}

}

