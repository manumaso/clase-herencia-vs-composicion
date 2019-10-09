import wollok.game.*
import ataques.*
import pokemon.*

class Pokemon {
	
	var contador = 0
	
	var property vida = 100
	
	var property nivel
	
	var property ataqueActual = placaje
	
	const property ataques = [placaje]
	
	var property position = game.origin() //Wollok-game
	
	method nombre()
	
	method image() //Wollok-game
	
	method atacar() {
		var posicionDeLaDerecha = position.right(1)
		var pokemonCercano = game.getObjectsIn(posicionDeLaDerecha)
		
		//TODO Sacar cheat si se puede
		if(!pokemonCercano.isEmpty())
			self.ataqueActual().usar(pokemonCercano.get(0))
	}
	
	method recibirDanio(ataque) {
		
		vida = 0.max( vida - ataque.danio() )
		
		if(vida == 0){ 
			self.rendirse()
		}
		else{
			game.say(brock, self.nombre() + " recibió " + ataque.danio() + " de daño")
		}
	}
	
	method agregarAtaque(unAtaque) = ataques.add(unAtaque)
	
	method rendirse() = game.say(brock, self.nombre() + " ha sido derrotado..." )
	
	method cambiarAtaqueActual() {
		
		if(contador + 1 > self.ataques().size() - 1){
			contador = 0
			ataqueActual = self.ataques().get(contador)
			return ataqueActual
		}
		else{
			contador += 1
			ataqueActual = self.ataques().get(contador)
			return ataqueActual
		}
	}
	
}

class Fuego inherits Pokemon {
	
	//TODO no se ejecutan al crear un object?
	constructor(){
		ataques.add(lanzallamas)
	}
	
}

class Agua inherits Pokemon{
	
	constructor(){
		ataques.add(chorroDeAgua)
	}
}

class Planta inherits Pokemon{
	
	constructor(){
		ataques.add(hojasNavaja)
	}
}