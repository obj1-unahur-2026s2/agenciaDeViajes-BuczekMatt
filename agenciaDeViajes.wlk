

object agencia {
    
    method cambiarRolAlCoordinador(unCoordinador, unRol) {
      if (unRol == guia || unRol == asistenteLogistico 
      || unRol == acompaniante){
        unCoordinador.cambiarRol(unRol)
    }else{
        throw new Exception(message = "Rol no homologado")
    }
    }
}


class Packs {
    const beneficiosEspeciales = []
    var duracionEnDias = 0
    var precioBase
    var coordinadorACargo
    method coordinadorACargo() {
      return coordinadorACargo
    }
    method duracionEnDias() {
      return duracionEnDias
    }
    method cambiarDuracionDeDias(cantDias) {
      duracionEnDias = cantDias
    }
    method agregarBeneficio(unBeneficio) {
      beneficiosEspeciales.add(unBeneficio)
    }
    method valorFinal() {
      return precioBase + beneficiosEspeciales.filter({ beneficio => beneficio.estaVigente() }).sum({beneficio => beneficio.costo()})
    }
    method esPremium()
}
object trasladosPrivados {
    var estaVigente = true
    method costo() {
        return 10
    }
    method estaVigente() {
      return estaVigente
    }
    method ponerVigente() {
      estaVigente = true
    }
    method quitarDeVigencia() {
      estaVigente = false
    }

}
object accesoSalasVip {
    var estaVigente = true
    method costo() {
        return 10
    }
    method estaVigente() {
      return estaVigente
    }
    method ponerVigente() {
      estaVigente = true
    }
    method quitarDeVigencia() {
      estaVigente = false
    }

}
object segurosAdicionales {
    var estaVigente = true
    method costo() {
        return 10
    }
    method estaVigente() {
      return estaVigente
    }
    method ponerVigente() {
      estaVigente = true
    }
    method quitarDeVigencia() {
      estaVigente = false
    }

}

class Nacionales inherits Packs {
    const actividades = []
    var provDestino
    method cambiarProvinciaDestino(unaProvincia) {
      provDestino = unaProvincia
    }
    method provDestino() {
      return provDestino
    }
    method agregarActividad(unaActividad) {
      actividades.add(unaActividad)
    }
    override method esPremium() {
      return (self.duracionEnDias() > 10) && (self.coordinadorACargo().estaAltamenteCalificado())
    }
    
}
class Internacionales inherits Packs {
    var paisDestino 
    var cantEscalas = 0
    var esLugarDeInteres = true
    method cantEscalas() {
      return cantEscalas
    }
    method cambiarPaisDestino(unPais) {
      paisDestino = unPais
    }
    method cambiarCantEscalas(unaCantidad) {
      cantEscalas = unaCantidad
    }
    method esLugarDeInteres() {
      return esLugarDeInteres
    }
    method ponerComoLugarDeInteres() {
      esLugarDeInteres = true
    }
    method quitarComoLugarDeInteres() {
      esLugarDeInteres = false
    }
    override method valorFinal() {
      return super()*1.2
    }
    override method esPremium(){
        return (self.esLugarDeInteres())&&(self.duracionEnDias() > 20)&&(self.cantEscalas()==0)
    }
}

class Coordinador {
    var cantViajesRealizados = 0
    var estaMotivado = true
    var aniosDeExperiencia = 0
    var rol = guia
    method aniosDeExperiencia() {
      return aniosDeExperiencia
    }
    method cantViajesRealizados() {
      return cantViajesRealizados
    }
    method realizarViaje() {
      cantViajesRealizados+=1
    }
    method cambiarCantDeViajesRealizados(unaCantidad) {
      cantViajesRealizados = unaCantidad
    }
    method estaMotivado() {
      return estaMotivado
    }
    method motivar() {
      estaMotivado = true
    }
    method desmotivar() {
      estaMotivado = false
    }
    method aumentarAnioDeExperiencia(){
        aniosDeExperiencia+=1
    }
    method cambiarRol(unRol) {
      rol = unRol
    }
    method estaAltamenteCalificado() {
      return self.cantViajesRealizados() >= 20 && self.cumpleSuRol()
    }
    method cumpleSuRol() {
      return (rol == guia && self.estaMotivado() || 
              rol == asistenteLogistico && self.aniosDeExperiencia()>=3 ||
              rol == acompaniante 
      )

    }
}

object guia {
  
}
object asistenteLogistico {
  
}
object acompaniante {
  
}