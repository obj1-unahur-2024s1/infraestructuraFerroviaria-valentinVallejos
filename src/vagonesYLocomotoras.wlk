class VagonDePasajeros{
	const largo
	const ancho
	var property tieneBanos
	var estaOrdenado
	
	method cantMaxDePasajeros() = (largo * if(ancho <= 3) 8 else 10 ) -  if (not estaOrdenado) 15 else 0 
	
	method cargaMax() = if (self.tieneBanos()) 300 else 800
	
	method pesoMax() = 2000 + (80 * self.cantMaxDePasajeros()) + self.cargaMax()
	
	method hacerMantenimiento() {estaOrdenado = true}
}

class VagonDeCarga{
	const cargaMaxIdeal 
	var  cantDeMaderasSueltas
	
	method tieneBanos() = false
	
	
	method cantMaxDePasajeros() = 0
	
	method cargaMax() = cargaMaxIdeal - (400 * cantDeMaderasSueltas)
	
	method pesoMax() = 1500 + self.cargaMax()
	
	method hacerMantenimiento() {cantDeMaderasSueltas = 0.max(cantDeMaderasSueltas-2)}
}

class VagonDormitorio{
	var cantDeCompratimietos
	var cantDeCamasPoeCompartimietos
	
	method tieneBanos() = true
	
	method cantMaxDePasajeros() = cantDeCompratimietos * cantDeCamasPoeCompartimietos
	
	method cargaMax() = 1200
	
	method pesoMax() = 4000 + (80 * self.cantMaxDePasajeros()) + self.cargaMax()
	
	method hacerMantenimiento() {}
	
	
}

class Locomotora{
	const property peso 
	const property maxPesoDeArrastre
	const property velocidadMax
	
	method esEficiente() = maxPesoDeArrastre >= (peso*5)

}