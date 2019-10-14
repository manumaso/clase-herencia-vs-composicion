import wollok.game.*
import clock.*

class Animation {
	
	var property initialTime = clock.timePassed()

	var property imagenes = []

	method timePassedSinceInitialTime() = clock.timePassed() - initialTime

	method image() = imagenes.get(self.timePassedSinceInitialTime() % imagenes.size())
}

