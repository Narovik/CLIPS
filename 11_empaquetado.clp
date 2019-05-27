; Autor: Víctor Manuel Rodríguez Navarro
; Fecha: 25/05/19
(defrule forrar
	(declare (salience 100))
	?f <- (Articulo
			(Nombre ?n)
			(Forrado No))
	=>
		(modify ?f (Forrado Si))
		(printout t ?n " ha sido forrado" crlf)
)
(defrule empaquetarFragil
	?a <- (Articulo
			(Nombre ?n)
			(Tipo fragil)
			(Forrado Si)
			(Empaquetado No)
			(Dimension ?dim)
			)
	?c <- (Caja
				(IdCaja ?id)
				(EspacioLibre ?e&:(> ?e ?dim)); y exista un espaciolibre mayor que la dimension
				(Empezada ?empezada)
				(Abierta ?abierta)
				(TipoContenido ?contenido)
			)
		=>
			(if  (eq ?empezada Si) then
				(if (eq ?contenido fragil) then
					(retract ?a)
					(assert (Articulo
						(Nombre ?n)
						(Tipo fragil)
						(Forrado Si)
						(Empaquetado Si)
						(Dimension ?dim)))
					(retract ?c)
					(assert (Caja
						(IdCaja ?id)
						(Empezada Si)
						(Abierta Si)
						(TipoContenido fragil)
						(EspacioLibre (- ?e ?dim))))		
					(printout t ?n " EMPAQUETADO EN " ?id ". LIBRE: "(- ?e ?dim) crlf)
				);Si el contenido es pesado, no hace nada
			else ;No esta la caja empezada
					(retract ?a)
					(assert (Articulo
						(Nombre ?n)
						(Tipo fragil)
						(Forrado Si)
						(Empaquetado Si)
						(Dimension ?dim)))
					(retract ?c)
					(assert (Caja
						(IdCaja ?id)
						(Empezada Si)
						(Abierta Si)
						(TipoContenido fragil)
						(EspacioLibre (- ?e ?dim))))		
					(printout t ?n " EMPAQUETADO EN " ?id ". LIBRE: "(- ?e ?dim) crlf)
		)
			
)
(defrule empaquetarPesado
	?a <- (Articulo
			(Nombre ?n)
			(Tipo pesado)
			(Forrado Si)
			(Empaquetado No)
			(Dimension ?dim)
			)
	?c <- (Caja
				(IdCaja ?id)
				(EspacioLibre ?e&:(> ?e ?dim)); y exista un espaciolibre mayor que la dimension
				(Empezada ?empezada)
				(Abierta ?abierta)
				(TipoContenido ?contenido)
			)
		=>
			(if  (eq ?empezada Si) then
				(if (eq ?contenido pesado) then
					(retract ?a)
					(assert (Articulo
						(Nombre ?n)
						(Tipo pesado)
						(Forrado Si)
						(Empaquetado Si)
						(Dimension ?dim)))
					(retract ?c)
					(assert (Caja
						(IdCaja ?id)
						(Empezada Si)
						(Abierta Si)
						(TipoContenido pesado)
						(EspacioLibre (- ?e ?dim))))		
					(printout t ?n " EMPAQUETADO EN " ?id ". LIBRE: "(- ?e ?dim) crlf)
				);Si el contenido es pesado, no hace nada
			else ;No esta la caja empezada
					(retract ?a)
					(assert (Articulo
						(Nombre ?n)
						(Tipo pesado)
						(Forrado Si)
						(Empaquetado Si)
						(Dimension ?dim)))
					(retract ?c)
					(assert (Caja
						(IdCaja ?id)
						(Empezada Si)
						(Abierta Si)
						(TipoContenido pesado)
						(EspacioLibre (- ?e ?dim))))		
					(printout t ?n " EMPAQUETADO EN " ?id ". LIBRE: "(- ?e ?dim) crlf)
		)
			
)