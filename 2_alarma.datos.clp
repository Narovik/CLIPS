;Datos de alarma para que se aplique la regla
(deffacts HechosSistemaExtincion
	(SistemaExtincion
		(tipo DioxidoCarbono)
		(status operativo)
		(UltimaRevision diciembre)))
(deffacts EmergenciaB
	(Emergencia
		(tipo ClaseB) 
		(sector 12)
		(campo 1)))