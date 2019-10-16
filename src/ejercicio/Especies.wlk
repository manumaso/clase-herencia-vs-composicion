import wollok.game.*
import estadio.*
import game.AnimatedSprite.*
import game.Image.*

class Especie {

	method evolucion() {
		self.error("No tiene evolución")
		return null
	}

	method usarHabilidad(pokemon)

	method alegria()

	method grito()

	method animacionHabilidad() = new Image(imagePath = "empty.png")

	method image()

	method menuSprite() = new Image(imagePath = "empty.png")

	method comerBaya(pokemon) {
		pokemon.disminuirHambre(1)
	}

}

class Charmander inherits Especie {

	const sprite = new AnimatedSprite(name = "charmander/", quantityOfFrames = 54)

	override method usarHabilidad(pokemon) {
		estadio.aumentarTemperatura(3)
		pokemon.aumentarHambre(1)
	}

	override method alegria() = estadio.sensacionTermica()

	override method evolucion() = new Charmeleon()

	override method image() = sprite.image()

	override method menuSprite() = "charmander/menu.png"

	override method grito() = "gritos/charmander.ogg"

	override method animacionHabilidad() = new AnimatedSprite(name = "ascuas/", quantityOfFrames = 7)

}

class Squirtle inherits Especie {

	const sprite = new AnimatedSprite(name = "squirtle/", quantityOfFrames = 32)

	override method usarHabilidad(pokemon) {
		estadio.empezaALlover()
		pokemon.aumentarHambre(3)
	}

	override method alegria() = if (estadio.lloviendo()) 7 else 3

	override method evolucion() = new Wartortle()

	override method image() = sprite.image()

	override method menuSprite() = "squirtle/menu.png"

	override method grito() = "gritos/squirtle.ogg"

}

class Bulbasaur inherits Especie {

	const sprite = new AnimatedSprite(name = "bulbasaur/", quantityOfFrames = 52)
	var obtuvoEnergiaDelSol = 0

	override method usarHabilidad(pokemon) {
		if (estadio.soleado()) {
			self.absorberEnergiaDelSol(pokemon, 10)
		} else {
			self.absorberEnergiaDelSol(pokemon, 1)
		}
	}

	method absorberEnergiaDelSol(pokemon, cantidadDeEnergia) {
		pokemon.disminuirHambre(cantidadDeEnergia)
		obtuvoEnergiaDelSol += 1
	}

	override method alegria() = obtuvoEnergiaDelSol * 3

	override method evolucion() = new Ivysaur()

	override method image() = sprite.image()

	override method menuSprite() = "bulbasaur/menu.png"

	override method grito() = "gritos/bulbasaur.ogg"

}

class Charmeleon inherits Especie {

	const sprite = new AnimatedSprite(name = "charmeleon/", quantityOfFrames = 58)

	override method alegria() = 5 + (estadio.temperatura() / 2)

	override method usarHabilidad(pokemon) {
		estadio.aumentarTemperatura(3)
		pokemon.aumentarHambre(2)
	}

	override method image() = sprite.image()

	override method menuSprite() = "charmeleon/menu.png"

	override method grito() = "gritos/charmander.ogg"

	override method animacionHabilidad() = new AnimatedSprite(name = "lanzallamas/", quantityOfFrames = 10)

}

class Wartortle inherits Especie {

	const sprite = new AnimatedSprite(name = "wartortle/", quantityOfFrames = 43)
	var alegria = 4

	override method alegria() = alegria

	override method usarHabilidad(pokemon) {
		alegria *= 1.2
		pokemon.aumentarHambre(1)
	}

	override method image() = sprite.image()

	override method menuSprite() = "wartortle/menu.png"

	override method grito() = "gritos/wartortle.ogg"

	override method animacionHabilidad() = new AnimatedSprite(name = "twister/", quantityOfFrames = 20)

}

class Ivysaur inherits Especie {

	const sprite = new AnimatedSprite(name = "ivysaur/", quantityOfFrames = 59)
	var bayasComidas = 0

	override method alegria() = bayasComidas * 2

	override method usarHabilidad(pokemon) {
		estadio.secarse()
		pokemon.aumentarHambre(1)
	}

	override method image() = sprite.image()

	override method menuSprite() = "ivysaur/menu.png"

	override method grito() = "gritos/ivysaur.ogg"

	override method comerBaya(pokemon) {
		super(pokemon)
		bayasComidas += 1
	}

}

