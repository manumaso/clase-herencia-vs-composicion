import brock.*

object estadio {

	var property temperatura = 10
	var property lloviendo = false

	method aumentarTemperatura(grados) {
		temperatura += grados
		brock.informar("La temperatura subió a " + self.sensacionTermica().toString())
	}

	method sensacionTermica() = if (lloviendo) (temperatura / 2) else temperatura

	method empezaALlover() {
		lloviendo = true
		brock.informar("Se largó a llover")
	}

	method secarse() {
		lloviendo = false
	}

	method soleado() = !lloviendo

}

