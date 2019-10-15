import movimientos.*
import wollok.game.*
import ejercicio.Entrenador.*
import ejercicio.Especies.*
import ejercicio.Pokemon.*
import ejercicio.brock.*
import clock.*
import game.AnimatedSprite.*
import game.numberDisplay.*


object stats {
	method image() = "stats.png"
}

class Cursor {
	const entrenador
	const sprite = new AnimatedSprite(name="cursor/", imageExtension="png", quantityOfFrames=9)
	var property indiceDePokemonApuntado = 0
	
	method image() = sprite.image()
	method cambiarPokemonSeleccionado() {
		indiceDePokemonApuntado = (indiceDePokemonApuntado + 1) % entrenador.equipo().size()
	} 
	method position() = game.at(indiceDePokemonApuntado * 2, game.height() - 2)
}

class DisplayPokemonActual {
	const property entrenador
	method image() = entrenador.pokemonActual().image() 
}

class DisplayMenuEquipo {
	const property pokemon
	method image() = pokemon.menuSprite()
}

object config {
	const bulbasaur = new Pokemon(especie = new Bulbasaur())
	const charmander = new Pokemon(especie = new Charmander())
	const squirtle = new Pokemon(especie = new Squirtle())
	const otroSquirtle = new Pokemon(especie = new Squirtle())
	const entrenador = new Entrenador(equipo = [charmander, otroSquirtle, bulbasaur, squirtle])
	const cursor = new Cursor(entrenador = entrenador)
	
	method alturaMaxima() = 12
	method anchoMaximo() = 10
	
	method configurarJuego(){
		game.onTick(60, "Advance time", { clock.advanceTime(1) })
		self.configurarVentana()
		self.agregarComponentesVisuales()
		self.configurarAcciones()
	}

	method configurarVentana(){
		game.title("Pokemon: Herencia vs composicion")
		game.height(self.alturaMaxima())
		game.width(self.anchoMaximo())
	}
	
	method agregarMenuDeEquipo() {
		var unoccuppiedTopLeft = game.at(0, game.height() - 2)
		
		entrenador.equipo().forEach { pokemon => 
			game.addVisualIn(new DisplayMenuEquipo(pokemon=pokemon), unoccuppiedTopLeft)
			unoccuppiedTopLeft = unoccuppiedTopLeft.right(2)
		}
	}
	
	method configurarInformador() {
		const brock = new Brock(dondeHabla=burbujaDeTexto)
		informador.informador(brock)
		game.addVisualIn(brock, game.at(0, 0))
		game.addVisualIn(burbujaDeTexto, game.at(2, 2))
	}
	
	method agregarPokemonActual() {
		game.addVisualIn(new DisplayPokemonActual(entrenador=entrenador), game.center().left(1).down(3))
		game.addVisualIn(stats, game.at(game.width()-5, 0))
		const felicidadDisplay = new NumberDisplay(getNumber = { entrenador.pokemonActual().felicidad() }, quantityOfDigits = 3)
		felicidadDisplay.draw(game.at(game.width() - 2, 1))
		const hambreDisplay = new NumberDisplay(getNumber = { entrenador.pokemonActual().hambre() }, quantityOfDigits = 3)
		hambreDisplay.draw(game.at(game.width() - 2, 2))
	}
	
	method agregarComponentesVisuales(){
		game.boardGround("arena.png")
		
		self.agregarMenuDeEquipo()

		game.addVisual(cursor)
		
		self.agregarPokemonActual()

		self.configurarInformador()
	}
	
	method configurarAcciones(){
		keyboard.f().onPressDo({
			entrenador.cambiarPokemon()
			cursor.cambiarPokemonSeleccionado()
		})
		keyboard.e().onPressDo({ entrenador.intentarEvolucionar()})
		keyboard.q().onPressDo({ entrenador.darDeComer() })
		keyboard.w().onPressDo({ entrenador.ordenarUsarHabilidad()})
	}
	
}