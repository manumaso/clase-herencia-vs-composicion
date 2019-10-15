import wollok.game.*

object sonidista {
	method tocar(sonido) {
		console.println("tocando " + sonido)
		game.sound(sonido)
	}
	method loop(sonido, segundos) {
		self.tocar(sonido)
		game.schedule(segundos * 1000, { self.loop(sonido, segundos) })
	}
}

object sonidistaMudo {
	method tocar(sonido) {}
	method loop(sonido, segundos) {}
}