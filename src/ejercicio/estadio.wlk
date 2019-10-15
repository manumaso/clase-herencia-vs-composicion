import brock.*
import game.AnimatedSprite.*
import wollok.game.*

object estadio {

	var property temperatura = 10
	var property lloviendo = false

	method aumentarTemperatura(grados) {
		temperatura += grados
		game.addVisualIn(ascuas, game.origin())
		brock.informar("La temperatura subió a " + self.sensacionTermica().toString())
	}

	method sensacionTermica() = if (lloviendo) (temperatura / 2) else temperatura

	method empezaALlover() {
		lloviendo = true
		game.addVisualIn(danzaLluvia, game.origin())
		brock.informar("Se largó a llover")
	}

	method secarse() {
		lloviendo = false
	}

	method soleado() = !lloviendo

}

object danzaLluvia{
	const sprite = new AnimatedSprite(name="danza lluvia/lluvia_estado_", imageExtension="png", quantityOfFrames=7)
	method image() = sprite.image()
}

object ascuas{
	const sprite = new AnimatedSprite(name="ascuas/temperatura_", imageExtension="png", quantityOfFrames=6)
	method image() = sprite.image()
}

object diaSoleado{
	const sprite = new AnimatedSprite(name="dia soleado/sol_", imageExtension="png", quantityOfFrames=6)
	method image() = sprite.image()
}