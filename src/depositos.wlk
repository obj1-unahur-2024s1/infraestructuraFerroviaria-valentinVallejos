import formaciones.*
class Deposito {
	const formaciones = []
	const locomotorasSueltas = []
	
	method vagonesMasPesados() = formaciones.map({x => x.vagonMasPesado()}).asSet()
	
	method necesitaConductorExperimentado() = formaciones.any({x=> ( x.esFormacionCompleja() ) || ( x.pesoMax() > 80000 ) })
	
	method hayLocomotoraQuePuedeArrastrar(num) = locomotorasSueltas.any({x=>x.maxPesoDeArrastre() >= num})
	
	method locomotoraConArrastre(num) = locomotorasSueltas.find({x=>x.maxPesoDeArrastre() >= num})
	
	method hacerMovibleA(unaFormacion){
		const empujeFaltante = unaFormacion.cuantoEmpujeLeFalta()
		if (self.hayLocomotoraQuePuedeArrastrar(empujeFaltante)){
			unaFormacion.acoplarLocomotora(self.locomotoraConArrastre(empujeFaltante))
		}
	}
	
	
	method agregarLocomotoraA(unaFormacion){
		if(not unaFormacion.puedeMoverse()){
		self.hacerMovibleA(unaFormacion)
		}
	}
}