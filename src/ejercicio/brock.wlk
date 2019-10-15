import wollok.game.*

object informador {

	var property informador = new InformadorMudo()

	method informar(mensaje) {
		informador.informar(mensaje)
	}

	method habilidadFueUsada(nombreDePokemon, nombreDeAtaque) {
		informador.habilidadFueUsada(nombreDePokemon, nombreDeAtaque)
	}

}

class InformadorMudo {

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

object burbujaDeTexto {

	method image() = "empty.png"

}

