import brock.*
import game.AnimatedSprite.*
import wollok.game.*

object estadio {

	var property temperatura = 10
	var property lloviendo = false

	method aumentarTemperatura(grados) {
		temperatura += grados
		controladorDeAnimaciones.iniciarAnimacion(ascuas)
		informador.informar("La temperatura subió a " + self.sensacionTermica().toString())
	}

	method sensacionTermica() = if (lloviendo) (temperatura / 2) else temperatura

	method empezaALlover() {
		lloviendo = true
		controladorDeAnimaciones.iniciarAnimacion(danzaLluvia)
		informador.informar("Se largó a llover")
	}

	method secarse() {
		lloviendo = false
	}

	method soleado() = !lloviendo

}

object controladorDeAnimaciones{
	var animacionEnCurso = false
	
	method iniciarAnimacion(efectoDeHabilidad){
		if(!animacionEnCurso){
			animacionEnCurso = true
			game.addVisualIn(efectoDeHabilidad, game.origin())
			self.finalizarAnimacion(efectoDeHabilidad)
		}
	}
	
	method finalizarAnimacion(efectoDeHabilidad){
		game.schedule(1000, { =>
			game.removeVisual(efectoDeHabilidad)
			animacionEnCurso = false
		})
	}
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