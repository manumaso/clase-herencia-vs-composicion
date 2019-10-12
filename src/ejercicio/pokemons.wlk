import wollok.game.*
import pokemon.*
import estadio.*

object charmander inherits Pokemon {

	override method felicidad() = estadio.temperatura()

	override method nombre() = "Charmander"

	override method image() = "Charmander.png"

	override method ataquePrincipal() {
		estadio.aumentarTemperatura(10)
	}

}

object bulbasaur inherits Pokemon {

	override method felicidad() = vida

	method nombre() = "Bulbasaur"

	method image() = "Bulbasaur.png"

	override method ataquePrincipal() {
		vida += 10
	}

}

object squirtle inherits Pokemon {

	const property felicidadBase = 0

	override method felicidad() {
		if (estadio.lloviendo()) {
			return felicidadBase * 2
		} else {
			return felicidadBase
		}
	}

	method nombre() = "Squirtle"

	method image() = "Squirtle.png"

	override method ataquePrincipal() {
	}

}

object ditto inherits Pokemon {

	var pokemonCopiado = dittoSinCopiar

	method felicidad() = pokemonCopiado.felicidad()

	method nombre() = "Ditto"

	override method ataquePrincipal() {
		self.atacarOponente{ pokemon => pokemonCopiado = pokemon }
	}

	method image() = pokemonCopiado.image()
	
	override method ataqueSecundario() {
		pokemonCopiado.ataquePrincipal()
	}

}

object dittoSinCopiar {
	method felicidad() = 10
	
	method image() = "Ditto.png"
	
	method ataquePrincipal() {
	}
}

object brock {

	method image() = "brock.png"

	method position() = game.at(game.center().x(), 0)

	method pokemonFueDaniado(pokemon, danio) {
		if (pokemon.derrotado()) {
			game.say(self, pokemon.nombre() + " ha sido derrotado...")
		} else {
			game.say(self, pokemon.nombre() + " recibió " + danio + " de daño")
		}
	}

}

