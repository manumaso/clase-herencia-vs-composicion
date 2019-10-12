import movimientos.*
import ejercicio.pokemons.*
import wollok.game.*

object config {
	
	method alturaMaxima() = 12
	method anchoMaximo() = 12
	
	method alturaSuelo() = self.alturaMaxima() / 2
	
	method configurarJuego(){
		self.configurarVentana()
		self.agregarComponentesVisuales()
		self.configurarAcciones()
	}
	
	method configurarVentana(){
		game.title("Pokemon: Herencia vs composicion")
		game.height(self.alturaMaxima())
		game.width(self.anchoMaximo())
	}
	
	method agregarComponentesVisuales(){
		game.boardGround("arena.png")
		
		ditto.position(game.origin())
		game.addVisual(ditto)
		bulbasaur.position(game.at(self.anchoMaximo() - 2, 2))
		game.addVisual(bulbasaur)
		charmander.position(game.at(self.anchoMaximo() - 2, 5))
		game.addVisual(charmander)
		squirtle.position(game.at(self.anchoMaximo() - 2, 8))
		game.addVisual(squirtle)
		
		game.addVisual(brock)

		game.showAttributes(ditto)
		game.showAttributes(bulbasaur)
		game.showAttributes(charmander)
		game.showAttributes(squirtle)
		
	}
	
	method configurarAcciones(){
				
		var personajeControlado = ditto
		
		keyboard.f().onPressDo({
			//TODO: emprolijar esto, o hacer que se pueda rotar entre todos los personajes
			if(personajeControlado == ditto) {
				personajeControlado = charmander
			} else {
				personajeControlado = ditto
			}
		})
		
		keyboard.z().onPressDo({[ditto, charmander, squirtle, bulbasaur].forEach{pokemon => game.say(pokemon, pokemon.felicidad().toString())}})
		
		keyboard.e().onPressDo({personajeControlado.ataquePrincipal()})
		keyboard.q().onPressDo({personajeControlado.ataqueSecundario()})
		keyboard.w().onPressDo({personajeControlado.saludar()})
		
		keyboard.up().onPressDo({ movimiento.mover(personajeControlado, haciaArriba) })
		keyboard.down().onPressDo({ movimiento.mover(personajeControlado, haciaAbajo) })
		keyboard.left().onPressDo({ movimiento.mover(personajeControlado, haciaLaIzquierda) })
		keyboard.right().onPressDo({ movimiento.mover(personajeControlado, haciaLaDerecha) })
		//TODO: mostrar de alguna manera la felicidad de los pokemons
	}
	
}