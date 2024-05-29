class Formacion {
	const vagones  = []
	const locomotoras = []
	
	method acoplarVagon(unVagon) {vagones.add(unVagon)} 
	
	method desacoplaVagon(unVagon) {vagones.remove(unVagon)}
	
	method acoplarLocomotora(unLocomotora) {locomotoras.add(unLocomotora)} 
	
	method deaacoplarLocomotora(unLocomotora) {locomotoras.remove(unLocomotora)} 
	
	method pesoMax() = vagones.sum({x=>x.pesoMax()}) + locomotoras.sum({x=>x.peso()})
	
	method arrastreMax() = locomotoras.sum({x=>x.maxPesoDeArrastre()})
	
	method catMaxDePasajeros() = vagones.sum({x=>x.cantMaxDePasajeros()})
	
	method cantVagonesPopulares() = vagones.count({ x=>x.cantMaxDePasajeros() > 50 })
	
	method esFormacionCarguera() = vagones.all({x=>x.cargaMax() >= 1000 })
	
	method vagonMasLiviano() = vagones.min({x=>x.pesoMax()})
	
	method vagonMasPesado() = vagones.max({x=>x.pesoMax()})
	
	method dispercionDePeso() = self.vagonMasPesado().pesoMax() - self.vagonMasLiviano().pesoMax()
	
	method cantDeBanos() = vagones.count({x=>x.tieneBanos()})
	
	method hacerMantenimiento() { vagones.forEach({x=>x.hacerMantenimiento()}) }
	
	method vagonConMasPasajeros() =  vagones.max({x=>x.cantMaxDePasajeros()})
	
	method vagonConMenosPasajeros() = vagones.min({x=>x.cantMaxDePasajeros()})
	
	method estaEquilibrada() = ( self.vagonConMasPasajeros().cantMaxDePasajeros() - self.vagonConMenosPasajeros().cantMaxDePasajeros() ) <= 20
	
	method estaOrganizada(){
		const cantDeVagonesConPasajeros = vagones.count({x=>x.cantMaxDePasajeros() >= 1})
		
		return 
		if (cantDeVagonesConPasajeros >= 1) 
			vagones.take(cantDeVagonesConPasajeros).all({x=>x.cantMaxDePasajeros() >= 1}) 
		else true
	}
	
	method velocidadMax() = locomotoras.min({x=>x.velocidadMax()}).velocidadMax()
	
	method esEficiente() = locomotoras.all({x=>x.esEficiente()})
	
	method puedeMoverse() = self.arrastreMax() >= self.pesoMax()
	
	method cuantoEmpujeLeFalta() = if (self.puedeMoverse()) 0 else self.pesoMax() - self.arrastreMax()
	
	method esFormacionCompleja() = ( vagones.size() + locomotoras.size() ) > 8
	
}
