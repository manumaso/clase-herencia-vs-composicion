import movimientos.*
import wollok.game.*
import ejercicio.Entrenador.*
import ejercicio.Especies.*
import ejercicio.Pokemon.*
import informador.*
import clock.*
import game.AnimatedSprite.*
import game.displays.*
import game.juego.*
import game.animador.*
import ejercicio.estadio.*
import game.Cursor.*
import game.Image.*
import game.sonidista.*


object config {

	const bulbasaur = new Pokemon(especie = new Bulbasaur())
	const charmander = new Pokemon(especie = new Charmander())
	const squirtle = new Pokemon(especie = new Squirtle())
	const otroSquirtle = new Pokemon(especie = new Squirtle())
	const entrenador = new Entrenador(equipo = [ charmander, otroSquirtle, bulbasaur, squirtle ])
	const cursor = new Cursor(entrenador = entrenador)

	method alturaMaxima() = 12

	method anchoMaximo() = 10

	method configurarJuego() {
		self.configurarSonido()
		self.configurarReloj()
		self.configurarAnimador()
		self.configurarVentana()
		self.agregarComponentesVisuales()
		self.configurarAcciones()
	}
	
	method configurarSonido() {
		juego.sonidista(sonidistaMudo)
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
		entrenador.equipo().forEach{ pokemon =>
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

		const felicidadDisplay = new NumberDisplay(getNumber = { entrenador.pokemonActual().felicidad() }, quantityOfDigits = 3)
		felicidadDisplay.draw(game.at(game.width() - 2, 1))

		const hambreDisplay = new NumberDisplay(getNumber = { entrenador.pokemonActual().hambre() }, quantityOfDigits = 3)
		hambreDisplay.draw(game.at(game.width() - 2, 2))
	}
	
	method agregarClima() {
		game.addVisualIn(estadio, game.origin())
	}
	
	method agregarTermometro() {
		const termometro = new TermometroDisplay(getTemperatura = { estadio.sensacionTermica() })
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
		keyboard.f().onPressDo({ entrenador.cambiarPokemon()
			cursor.cambiarPokemonSeleccionado()
		})
		keyboard.e().onPressDo({ entrenador.intentarEvolucionar()})
		keyboard.q().onPressDo({ entrenador.darDeComer()})
		keyboard.w().onPressDo({ entrenador.ordenarUsarHabilidad()})
	}

}

