import wollok.game.*
import pokemon.*

object estadio {
	var property temperatura = 10
	var property lloviendo = false
	
	method aumentarTemperatura(grados) {
		temperatura += grados
	}
}
