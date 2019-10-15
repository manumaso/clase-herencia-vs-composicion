import game.TemporaryVisual.*
import informador.*
import animador.*
import ejercicio.estadio.*
import game.AnimatedSprite.*
import wollok.game.*
import game.sonidista.*


object juego {
	var property informador = informadorMudo
	var property animador = animadorDeMentira
	var property sonidista = sonidistaMudo
	method empezoElJuego() {
		sonidista.loop("palletTown.mp3", 90)
	}
	method habilidadFueUsada(pokemon) {
		sonidista.tocar("attack.mp3")
		informador.informar("Tu pokemon usó su habilidad")
	}
	method bayaFueComida(pokemon) {
		animador.animaEn(new AnimatedSprite(name="hearts/", quantityOfFrames=8), 500, game.center().down(1))
		sonidista.tocar(pokemon.grito())
		informador.informar("Se le dio una baya al pokemon")
	}
	method temperaturaSubio(sensacionTermica) {
		informador.informar("La temperatura subió a " + sensacionTermica.toString())
	}
	method seLargoALlover() {
		informador.informar("Se largó a llover")
	}
}
