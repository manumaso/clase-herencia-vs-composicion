import brock.*

class Entrenador {
	var property equipo = []
	
	method pokemonActual() = equipo.first()
	
	method cambiarPokemon() {
		equipo = equipo.drop(1) + equipo.take(1)
	}
	
	method darDeComer() {
		self.pokemonActual().comerBaya()
		informador.informar("Se le dio una baya al pokemon")
	}
	
	method ordenarUsarHabilidad() {
  		self.pokemonActual().usarHabilidad()
	}
	
	method intentarEvolucionar() {
		self.pokemonActual().evolucionar()
	}
	
	method image() = self.pokemonActual().image()
}

class Baya {
	var property valorNutritivo = 10
}

