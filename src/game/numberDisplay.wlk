import NumberFormatter.*
import wollok.game.*

class NumberDisplay {

	const getNumber = { 0 }
	var quantityOfDigits = 1
	var digitDisplays = []

	method draw(position) {
		quantityOfDigits.times{ d => digitDisplays.add(new DigitDisplay(digit = d, getNumber = getNumber, startNumberPosition = position))}
		digitDisplays.forEach{ digitDisplay => game.addVisual(digitDisplay)}
	}
}

class DigitDisplay {

	const digit = 1
	const getNumber = { 0 }
	const startNumberPosition

	method position() = startNumberPosition.left((digit - 1).div(3))

	method image() {
		const number = getNumber.apply()
		const numberName = if (digit > number.digits()) "0" else number.toString().charAt(number.digits() - digit)
		const numberPosition = ((3 - digit).abs() % 3).toString()
		return "digits/resized_" + numberName + numberPosition + ".png"
	}

}

