
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
  self.factorLiberacion(evento)
}

method factorLiberacion(evento)

method puedeLiberarse() = self.intensidadElevada() and self.factorPosibilidadLiberarse()

method factorPosibilidadLiberarse() = true

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

override method factorPosibilidadLiberarse() = palabrotas.any({palabrota => palabrota.length() > 7})

override method factorLiberacion(_){
palabrotas.remove(palabrotas.first())
}

}

class Alegria inherits Emocion{

override method factorPosibilidadLiberarse() = self.eventos().size() % 2 == 0

override method factorLiberacion(_){
  if(intensidad < 0){
  intensidad = -1*intensidad
}
}

}

class Tristeza inherits Emocion{

var causa

method cambiarCausa(causaNueva){
  causa = causaNueva
}

override method factorPosibilidadLiberarse() = causa != "melancolia"

override method factorLiberacion(evento){
  causa = evento.descripcion()
}

}

class DesagradoOTemor inherits Emocion{

override method factorPosibilidadLiberarse() = eventosVividos.size() > intensidad

}

class Ansiedad inherits Emocion{

var nivelNerviosismo

override method factorPosibilidadLiberarse() = eventosVividos.size() > intensidad*nivelNerviosismo

override method factorLiberacion(evento){
 intensidad += nivelNerviosismo + evento.impacto()
}
}
/*La herencia permite utilizar los metodos y atributos de la clase padre para evitar la repetición de codigo. El polimorfismo permite que un conjunto de objetos
puedan admitir un mismo mensaje/metodo. En este caso utilizo los mismos metodos que la clase padre pero actuando de manera diferente, utilizando el override. */

class Evento{

var impacto
var descripcionEvento

method descripcion() = descripcionEvento

method impacto() = impacto

}
