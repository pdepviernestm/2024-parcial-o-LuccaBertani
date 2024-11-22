object pepita {
  var energy = 100

  method energy() = energy

  method fly(minutes) {
    energy = energy - minutes * 3
  }
}

class Persona{

var edad
var emociones = []

method edad() = edad

method cumplirAnios(){
  edad+=1
}

method emociones() = emociones

method nuevaEmocion(emocion){
emociones.add(emocion)
}

method estaPorExplotarEmocionalmente() = emociones.all({emocion => emocion.puedeLiberarse()})

method vivirEvento(evento){
  emociones.forEach({emocion => emocion.agregarEvento(evento)})
}
}

class Emocion{

var eventosVividos = []
var intensidad

method eventos() = eventosVividos

method agregarEvento(evento){
  eventosVividos.add(evento)
}

method modificarIntensidad(intensidad_nueva){
  intensidad = intensidad_nueva
  } 

method intensidadElevada() = intensidad >= intensidadEmociones.intensidadLimite()

method liberarse(evento){
  intensidad = evento.impacto()
}

method puedeLiberarse() = self.intensidadElevada()

}

object intensidadEmociones{

  var intensidadLimite = 0

  method intensidadLimite() = intensidadLimite

  method modificarIntensidadLimite(intensidad_){
    intensidadLimite = intensidad_
  }

}

class Furia inherits Emocion(intensidad=100){

var palabrotas = []

method aprenderPalabrota(palabrota){
  palabrotas.add(palabrota)
}

override method puedeLiberarse() = super() and palabrotas.any({palabrota => palabrota.length() > 7})

override method liberarse(evento){
super(evento)
palabrotas.remove(palabrotas.first())
} 

}

class Alegria inherits Emocion{

override method liberarse(evento){
super(evento)
if(intensidad < 0){
  intensidad = -1*intensidad
}
}

override method puedeLiberarse() = super() and self.eventos().size() % 2 == 0

}

class Tristeza inherits Emocion{

var causa

method cambiarCausa(causaNueva){
  causa = causaNueva
}

override method puedeLiberarse() = super() and causa != "melancolia"

override method liberarse(evento){
super(evento)
causa = evento.descripcion()

}

}

class DesagradoOTemor inherits Emocion{

override method puedeLiberarse() = super() and eventosVividos.size() > intensidad

}

class Ansiedad inherits Emocion{

var nivelNerviosismo

override method puedeLiberarse() = super() and eventosVividos.size() > intensidad*nivelNerviosismo

override method liberarse(evento){
 super(evento)
 intensidad += nivelNerviosismo + evento.impacto()
}
}
/*La herencia permite utilizar los metodos y atributos de la clase padre para evitar la repetición de codigo. El polimorfismo lo utilizo para llamar a los mismos
metodos que la clase padre pero realizandole modificaciones extra. Aparte para utilizar las funcionalidades del metodo de la clase padre sin repetir codigo, utilize super()*/

class Evento{

var impacto
var descripcionEvento

method descripcion() = descripcionEvento

method impacto() = impacto

}
