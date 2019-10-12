import wollok.game.*
import pokemons.*

class Pokemon {
	var property vida = 100
	var property position
	var property nombre

	method felicidad()

	method ataquePrincipal()

	method ataqueSecundario() {
		self.atacarOponente { pokemon => pokemon.recibirDanio(30) }
	}

	method recibirDanio(danio) {
		vida = 0.max(vida - danio)
		brock.pokemonFueDaniado(self, danio)
	}

	method atacarOponente(ataque) {
		var posicionDeLaDerecha = position.right(1)
		game.getObjectsIn(posicionDeLaDerecha).take(1).forEach(ataque)
	}

	method image() // Wollok-game

	method derrotado() = vida == 0
	
	method saludar() {
		if(self.derrotado()) {
			game.say(self, "x_x")
		} else {
			game.say(self, self.nombre() + "!")
		}
	}
}

