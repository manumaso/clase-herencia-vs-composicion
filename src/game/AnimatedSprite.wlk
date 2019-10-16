import wollok.game.*
import game.NumberFormatter.*
import game.clock.*

class AnimatedSprite {

	const name
	const imageExtension = "png"
	const quantityOfFrames
	var imagenes = []

	method frameNumber() = clock.timePassed() % quantityOfFrames

	method image() {
		if(imagenes.isEmpty()) self.inicializarImagenes()
		return imagenes.get(self.frameNumber())
	}

	method inicializarImagenes() {
		//Hackazo para que ande un poquito mas rapido la animacion, creo todos los strings al principio en vez de calcular el nombre en cada frame 
		//Se podría hacer más simple
		quantityOfFrames.times{ i =>
			const imageName = name + numberFormatter.toStringPaddingLeadingZeros(i - 1, quantityOfFrames.digits()) + "." + imageExtension  
			imagenes.add(imageName)
		}
	}

}

