import wollok.game.*
import estadio.*
import game.AnimatedSprite.*

class Especie {
	method evolucion() {
		self.error("No tiene evolución")
		return null
	}
	method usarHabilidad(pokemon)
	method alegria()
	method grito()
}

class Charmander inherits Especie {
	const sprite = new AnimatedSprite(name="charmander/resized_", imageExtension="png", quantityOfFrames=54)
	
	override method usarHabilidad(pokemon) {
		estadio.aumentarTemperatura(5)
		pokemon.aumentarHambre(10)
	}

	override method alegria() = estadio.sensacionTermica()

	override method evolucion() = new Charmeleon()

	method image() = sprite.image()
	
	method menuSprite() = "charmander/resized_menu2.png"
	
	method grito() = "gritos/charmander.ogg"
}

class Squirtle inherits Especie {
	const sprite = new AnimatedSprite(name="squirtle/resized_", imageExtension="png", quantityOfFrames=32)

	override method usarHabilidad(pokemon) {
		estadio.empezaALlover()
		pokemon.aumentarHambre(30)
	}

	override method alegria() = if (estadio.lloviendo()) 70 else 30

	override method evolucion() = new Wartortle()

	method image() = sprite.image()
	
	method menuSprite() = "squirtle/resized_menu2.png"
	
	method grito() = "gritos/squirtle.ogg"

}

class Bulbasaur inherits Especie {
	const sprite = new AnimatedSprite(name="bulbasaur/resized_", imageExtension="png", quantityOfFrames=52)

	var obtuvoEnergiaDelSol = 0

	override method usarHabilidad(pokemon) {
		if (estadio.lloviendo()) {
			self.absorberEnergiaDelSol(pokemon, 1)
		} else {
			self.absorberEnergiaDelSol(pokemon, 10)
		}
	}

	method absorberEnergiaDelSol(pokemon, cantidadDeEnergia) {
		pokemon.disminuirHambre(cantidadDeEnergia)
		obtuvoEnergiaDelSol += 1
	}

	override method alegria() = obtuvoEnergiaDelSol * 10

	override method evolucion() = new Ivysaur()

	method image() = sprite.image()

	method menuSprite() = "bulbasaur/resized_menu2.png"
	
	method grito() = "gritos/bulbasaur.ogg"
}

class Charmeleon inherits Especie {
	const sprite = new AnimatedSprite(name="charmeleon/resized_", imageExtension="png", quantityOfFrames=58)

	override method alegria() = 50 + (estadio.temperatura() / 2)

	override method usarHabilidad(pokemon) {
		estadio.aumentarTemperatura(30)
		pokemon.aumentarHambre(5)
	}
	
	method image() = sprite.image()
	
	method menuSprite() = "charmeleon/resized_menu2.png"
	
	method grito() = "gritos/charmander.ogg"

}

class Wartortle inherits Especie {
	const sprite = new AnimatedSprite(name="wartortle/resized_", imageExtension="png", quantityOfFrames=43)

	var alegria = 40

	override method alegria() = alegria

	override method usarHabilidad(pokemon) {
		alegria *= 1.5
		pokemon.aumentarHambre(10)
	}

	method image() = sprite.image()
	
	method menuSprite() = "wartortle/resized_menu2.png"
	
	method grito() = "gritos/wartortle.ogg"

}

class Ivysaur inherits Especie {
	const sprite = new AnimatedSprite(name="ivysaur/resized_", imageExtension="png", quantityOfFrames=59)

	var bayasComidas = 0

	override method alegria() = bayasComidas * 20

	override method usarHabilidad(pokemon) {
		estadio.secarse()
		pokemon.aumentarHambre(15)
	}

	method image() = sprite.image()
	
	method menuSprite() = "ivysaur/resized_menu2.png"
	
	method grito() = "gritos/ivysaur.ogg"

}

