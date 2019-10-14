import wollok.game.*
import game.Animation.*
import game.NumberFormatter.*

class AnimatedSprite {

	const name
	const imageExtension = "png"
	const quantityOfFrames
	var animation = null

	method images() {
		const frameNumbers = (0 .. quantityOfFrames - 1).map{ frameNumber => numberFormatter.toStringPaddingLeadingZeros(frameNumber, quantityOfFrames.digits()) }
		return frameNumbers.map{ frameNumber => name + frameNumber + "." + imageExtension }
	}

	method animation() {
		if (animation == null) {
			animation = new Animation(imagenes = self.images())
		}
		return animation
	}

	method image() = self.animation().image()

}

