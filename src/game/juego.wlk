import game.TemporaryVisual.*
import informador.*
import animador.*
import game.AnimatedSprite.*
import wollok.game.*
import game.sonidista.*


object juego {
	var property informador = informadorMudo
	var property animador = animadorDeMentira
	var property sonidista = sonidistaMudo
	method empezoElJuego() {
		sonidista.loop("palletTown.mp3", 90)
		game.schedule(0, { informador.informar("Apretá F para cambiar de pokemon") })
		game.schedule(2000, { informador.informar("Apretá Q para alimentarlo") })
		game.schedule(4000, { informador.informar("Apretá W para que use su habilidad") })
		game.schedule(6000, { informador.informar("Apretá E para intentar hacerlo evolucionar") })
	}
	method habilidadFueUsada(pokemon) {
		animador.animaEn(pokemon.animacionHabilidad(), 700, game.origin())
		sonidista.tocar("attack.mp3")
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
	method dejoDeLlover(){
		informador.informar("Salió el sol")
	}
	method pokemonEvoluciono() {
		informador.informar("Tu pokemon evoluciono!")
		sonidista.tocar("evolution.mp3")
	}
}
