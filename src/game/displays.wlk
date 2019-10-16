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
		const number = getNumber.apply().roundUp()
		const numberName = if (digit > number.digits()) "0" else number.toString().charAt(number.digits() - digit)
		const numberPosition = ((3 - digit).abs() % 3).toString()
		return "digits/" + numberName + numberPosition + ".png"
	}

}

class PokemonActualDisplay {

	const property entrenador

	method image() = entrenador.pokemonActual().image()

}

class MenuEquipoDisplay {

	const property pokemon

	method image() = pokemon.menuSprite()

}

class TermometroDisplay {
	const getTemperatura = { 0 }
	
	method image() {
		const temperatura = getTemperatura.apply()
		if(temperatura < 6) {
			return "termometro/px_termometro_1.png"
		} else if(temperatura < 12) {
			return "termometro/px_termometro_2.png"
		} else {
			return "termometro/px_termometro_3.png"
		}
	}
}


