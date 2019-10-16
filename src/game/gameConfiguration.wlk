import movimientos.*
import wollok.game.*
import informador.*
import clock.*
import game.AnimatedSprite.*
import game.displays.*
import game.juego.*
import game.animador.*
import game.Cursor.*
import game.Image.*
import game.sonidista.*
import ejercicio.entrenador.*
import ejercicio.estadio.*


object config {
	const cursor = new Cursor(pokemons = entrenador.equipo())
	
	method alturaMaxima() = 12

	method anchoMaximo() = 10

	method configurarJuego() {
		const charmander = new Pokemon(especie = new Charmander())
		const squirtle = new Pokemon(especie = new Squirtle())
		const bulbasaur = new Pokemon( especie= new Bulbasaur())
		entrenador.agregarPokemon(charmander)
		entrenador.agregarPokemon(squirtle)
		entrenador.agregarPokemon(bulbasaur)
		self.configurarSonido()
		self.configurarReloj()
		self.configurarAnimador()
		self.configurarVentana()
		self.agregarComponentesVisuales()
		self.configurarAcciones()
	}
	
	method configurarSonido() {
		juego.sonidista(sonidista)
	}
	
	method configurarReloj() {
		game.onTick(60, "Advance time", { clock.advanceTime(1)})
	}
	
	method configurarAnimador() {
		juego.animador(animador)
	}

	method configurarVentana() {
		game.title("Pokemon: Herencia vs composicion")
		game.height(self.alturaMaxima())
		game.width(self.anchoMaximo())
	}

	method agregarMenuDeEquipo() {
		var unoccuppiedTopLeft = game.at(0, game.height() - 2)
		const pokemons = entrenador.equipo()
		pokemons.forEach{ pokemon =>
			game.addVisualIn(new MenuEquipoDisplay(pokemon = pokemon), unoccuppiedTopLeft)
			unoccuppiedTopLeft = unoccuppiedTopLeft.right(2)
		} 
		game.addVisual(cursor)
	}

	method agregarInformador() {
		const burbujaDeTexto = new Image(imagePath="empty.png")
		const brock = new Brock(dondeHabla = burbujaDeTexto)
		juego.informador(brock)
		game.addVisualIn(brock, game.at(0, 0))
		game.addVisualIn(burbujaDeTexto, game.at(2, 2))
	}

	method agregarPokemonActual() {
		const displayPokemonActual = new PokemonActualDisplay(entrenador = entrenador)
		game.addVisualIn(displayPokemonActual, game.center().left(1).down(3))
		game.addVisualIn(new Image(imagePath = "stats.png"), game.at(game.width() - 5, 0))

		const felicidadDisplay = new NumberDisplay(getNumber = { entrenador.pokemonActual().felicidad() }, quantityOfDigits = 3) // TODO: Hacer que se muestre la felicidad del pokemon actual
		felicidadDisplay.draw(game.at(game.width() - 2, 1))

		const hambreDisplay = new NumberDisplay(getNumber = { entrenador.pokemonActual().hambre() }, quantityOfDigits = 3) // TODO: Hacer que se muestre el hambre del pokemon actual
		hambreDisplay.draw(game.at(game.width() - 2, 2))
	}
	
	method agregarClima() {
		//TODO: Hacer que se muestre el clima
	}
	
	method agregarTermometro() {
		const termometro = new TermometroDisplay(getTemperatura = { estadio.sensacionTermica() }) //TODO: hacer que muestre la temperatura real
		game.addVisualIn(termometro, game.center().down(1).right(3))
	}

	method agregarComponentesVisuales() {
		game.boardGround("arena.png")
		self.agregarMenuDeEquipo()
		self.agregarPokemonActual()
		self.agregarClima()
		self.agregarTermometro()
		self.agregarInformador()
	}

	method configurarAcciones() {
		keyboard.c().onPressDo({ entrenador.darDeComer() })
		
		keyboard.n().onPressDo({ 
			entrenador.cambiarPokemonActual()
			cursor.cambiarPokemonSeleccionado()
		})
		
		keyboard.h().onPressDo({ entrenador.usarHabilidad() })
		
		keyboard.e().onPressDo({ entrenador.evolucionarPokemon() })
		
		//TODO: Hacer que se configuren las teclas
	}

}

