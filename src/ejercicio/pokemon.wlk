import wollok.game.*
import tipos.*
import ataques.*

object charmander inherits Fuego {
	override method nombre () = "Charmander"
	override method image () = "Charmander.png"
}

object bulbasaur inherits Planta {
	override method nombre () = "Bulbasaur"
	override method image () = "bulbasaur.png"
}

object squirtle inherits Agua {
	override method nombre () = "Squirtle"
	override method image () = "Squirtle.png"
}

object ditto inherits Pokemon {
	
	var transformado = false
	var transformacion = ""
	
	override method nombre () = "Ditto"
	
	override method image () {
		if(transformado){
			return transformacion
		}else{
			return "Ditto.png"
		}
	}
	
	method transformarse(unPokemon){
		transformado = true
		transformacion = unPokemon.nombre() + ".png"
	}
}

object brock {
	method image () = "brock.png"
	method position () = game.at(game.center().x(), 0)
}