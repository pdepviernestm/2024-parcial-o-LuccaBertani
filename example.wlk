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

method nuevaEmocion(emocion){
emociones.add(emociones)
}

method estaPorExplotarEmocionalmente() = emociones.all({emocion => emocion.liberarse()})

method vivirEvento(evento)

}

class Emocion{

var eventosVividos = []
var intensidad
var estadoLiberar

method eventos() = eventosVividos

method agregarEvento(evento){
  eventosVividos.add(evento)
}

method modificarIntensidad(intensidad_nueva){
  intensidad = intensidad_nueva
  } 

method intensidadElevada()

method liberarse(evento){
  intensidad = evento.impacto()
}

method puedeLiberarse() = self.intensidadElevada()

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

class alegria inherits Emocion{

override method liberarse(evento){
super(evento)
if(intensidad < 0){
  intensidad = -1*intensidad
}
}

override method puedeLiberarse() = super() and self.eventos().length() % 2 == 0

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
class Evento{

var impacto
var descripcionEvento

method descripcion() = descripcionEvento

method impacto() = impacto

method vivirEvento(personas){

}


}
