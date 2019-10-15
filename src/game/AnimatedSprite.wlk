import wollok.game.*
import game.Animation.*
import game.NumberFormatter.*

class AnimatedSprite {

	const name
	const imageExtension = "png"
	const quantityOfFrames
	var animation = new AnimationLoader(animatedSprite = self)

	method images() {
		const frameNumbers = (0 .. quantityOfFrames - 1).map{ frameNumber => numberFormatter.toStringPaddingLeadingZeros(frameNumber, quantityOfFrames.digits()) }
		return frameNumbers.map{ frameNumber => name + frameNumber + "." + imageExtension }
	}

	method initializeAnimation() {
		animation = new Animation(imagenes = self.images())
	}

	method image() = animation.image()

}

class AnimationLoader {

	const animatedSprite
	var requestedLoad = false

	method image() {
		if (!requestedLoad) {
			requestedLoad = true
			game.schedule(0, { animatedSprite.initializeAnimation()})
		}
		return "loading/loading.png"
	}

}

