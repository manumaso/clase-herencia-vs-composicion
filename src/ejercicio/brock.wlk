import wollok.game.*

object brock {

	method image() = "brock.png"

	method position() = game.at(game.center().x(), 0)

	method informar(mensaje) {
		game.say(self, mensaje)
	}

	method habilidadFueUsada(nombreDePokemon, nombreDeAtaque) {
		self.informar(nombreDePokemon + " usó " + nombreDeAtaque)
	}

}
