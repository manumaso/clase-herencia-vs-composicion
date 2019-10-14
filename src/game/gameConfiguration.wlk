import movimientos.*
import wollok.game.*
import ejercicio.Entrenador.*
import ejercicio.Especies.*
import ejercicio.Pokemon.*
import ejercicio.brock.*
import clock.*
import game.AnimatedSprite.*


object config {
	const bulbasaur = new Pokemon(especie = new Bulbasaur())
	const charmander = new Pokemon(especie = new Charmander())
	const squirtle = new Pokemon(especie = new Squirtle())
	const entrenador = new Entrenador(equipo = [charmander, bulbasaur, squirtle])
	
	method alturaMaxima() = 12
	method anchoMaximo() = 12
	
	method alturaSuelo() = self.alturaMaxima() / 2
	
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
	
	method agregarComponentesVisuales(){
		game.boardGround("arena.png")

		game.addVisualIn(entrenador, game.center())
		
		game.addVisual(brock)

		game.showAttributes(entrenador)
	}
	
	method configurarAcciones(){
		keyboard.f().onPressDo({ entrenador.cambiarPokemon() })
		keyboard.e().onPressDo({ entrenador.intentarEvolucionar()})
		keyboard.q().onPressDo({ entrenador.darDeComer() })
		keyboard.w().onPressDo({ entrenador.ordenarUsarHabilidad()})
	}
	
}