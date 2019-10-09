import movimientos.*
import ejercicio.pokemon.*
import ejercicio.ataques.*
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
		
		game.addVisual(ditto)
		game.addVisualIn(bulbasaur, game.at(self.anchoMaximo() - 2, 2))
		game.addVisualIn(charmander, game.at(self.anchoMaximo() - 2, 5))
		game.addVisualIn(squirtle, game.at(self.anchoMaximo() - 2, 8))
		
		game.addVisual(brock)
		
		game.showAttributes(ditto)
		game.showAttributes(bulbasaur)
		game.showAttributes(charmander)
		game.showAttributes(squirtle)
		
	}
	
	method configurarAcciones(){
				
		var personajeControlado = ditto
		ditto.agregarAtaque(lanzallamas)
		ditto.agregarAtaque(transformacion)
		
		keyboard.e().onPressDo({personajeControlado.cambiarAtaqueActual()})
		keyboard.q().onPressDo({personajeControlado.atacar()})
		
		keyboard.up().onPressDo({ movimiento.mover(personajeControlado, haciaArriba) })
		keyboard.down().onPressDo({ movimiento.mover(personajeControlado, haciaAbajo) })
		keyboard.left().onPressDo({ movimiento.mover(personajeControlado, haciaLaIzquierda) })
		keyboard.right().onPressDo({ movimiento.mover(personajeControlado, haciaLaDerecha) })
	}
	
}