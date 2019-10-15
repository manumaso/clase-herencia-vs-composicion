import wollok.game.*

object informadorMudo {

	method informar(_mensaje) {
	}

	method habilidadFueUsada(_nombreDePokemon, _nombreDeAtaque) {
	}

}

class Brock {

	const dondeHabla

	method image() = "brock.png"

	method informar(mensaje) {
		game.say(dondeHabla, mensaje)
	}

	method habilidadFueUsada(nombreDePokemon, nombreDeAtaque) {
		self.informar(nombreDePokemon + " usó " + nombreDeAtaque)
	}

}
