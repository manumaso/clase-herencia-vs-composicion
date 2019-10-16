import ejercicio.estadio.*
import game.AnimatedSprite.*
import game.juego.*


object entrenador {
	
	const property equipo = []
	
	method darDeComer(){
		self.pokemonActual().comerBaya()
		juego.bayaFueComida(self.pokemonActual())
	}
	
	method pokemonActual() = equipo.first()
	
	method cambiarPokemonActual() {
		const pokemon = self.pokemonActual()
		equipo.remove(pokemon)
		equipo.add(pokemon)
	}
	
	method agregarPokemon(pokemon){
		equipo.add(pokemon)
	}
	
	method usarHabilidad(){
		self.pokemonActual().usoDeHabilidad()
	}
	
	method evolucionarPokemon(){
		self.pokemonActual().evolucionar()
	}
}

class Pokemon{
	
	var property hambre = 20
	
	var especie = new Charmander()
	
	const sprite = new AnimatedSprite(name = self.nombre() + "/", quantityOfFrames = self.quantityOfFrames())
	
	method nombre() = especie.nombre()
	
	method quantityOfFrames() = especie.quantityOfFrames()

	method felicidad() = 0.max(self.alegria() - hambre)
	
	method alegria() = especie.alegria()
	
	method comerBaya(){
		self.restarHambre(1)
	}
	
	method restarHambre(cantidad){
		hambre = 0.max(hambre - cantidad)
	}
	
	method evolucionar(){
		if(self.puedeEvolucionar()){
			especie = especie.evolucion()
		} else {
			self.error("El pokemon no puede evolucionar")
		}
	}
	
	method puedeEvolucionar() = self.felicidad() > 5 && especie.tieneEvolucion()
	
	method usoDeHabilidad() = especie.usoDeHabilidad(self)
	
	method aumentarHambre(cantidad){
		hambre += cantidad
	}
	
	method image() = self.nombre() + "/00.png"
	
	method menuSprite() = self.nombre() + "/menu.png"
	
	method grito() = "gritos/" + self.nombre() + ".ogg"
}

class Charmander {
	
	method usoDeHabilidad(pokemon){
		estadio.aumentarTemperatura(3)
		pokemon.aumentarHambre(1)
	}
	
	method evolucion() = new Charmeleon()
	
	method tieneEvolucion() = true
	
	method nombre() = "charmander"

	method alegria() = estadio.sensacionTermica()
	
	method quantityOfFrames() = 54
}

class Charmeleon {
	
	method alegria() = 5 + ( estadio.temperatura() / 2 )
	
	method usoDeHabilidad(pokemon){
		estadio.aumentarTemperatura(3)
		pokemon.aumentarHambre(2)
	}
	
	method evolucion() {
		self.error("No tengo evolucion")
	}
	
	method tieneEvolucion() = false
	
	method nombre() = "charmeleon"
	
	method quantityOfFrames() = 58
}

class Squirtle {
	
	method alegria(){
		if(estadio.estaLloviendo()){
			return 7
		}else{
			return 3
		}
	}
	
	method usoDeHabilidad(pokemon){
		estadio.llover()
		pokemon.aumentarHambre(3)
	}
	
	method nombre() = "squirtle"
	
	method quantityOfFrames() = 32
}

class Bulbasaur {

	var vecesQueObtuvoEnergiaDelSol = 0
	
	method usoDeHabilidad(pokemon){
		
		vecesQueObtuvoEnergiaDelSol += 1
		
		if(estadio.estaLloviendo()){
			pokemon.restarHambre(1)
		}
		
		else{
			pokemon.restarHambre(10)
		}
		
	}
	
	method alegria() = 3 * vecesQueObtuvoEnergiaDelSol
	
	method nombre() = "bulbasaur"
	
	method quantityOfFrames() = 52
}


