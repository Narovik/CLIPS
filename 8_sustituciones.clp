; Autor: Víctor Manuel Rodríguez Navarro
; Fecha: 23/05/19
(defrule inicial
	=>
	(assert (palabra B C D)))
	
(defrule c-dl
	?p <- (palabra $?x C $?y)
	=>
	(retract ?p)
	(assert (palabra ?x D L ?y))
)
(defrule c-bm
	?p <- (palabra $?x C $?y)
	=>
	(retract ?p)
	(assert (palabra ?x B M ?y))
)
(defrule b-mm
	?p <- (palabra $?x B $?y)
	=>
	(retract ?p)
	(assert (palabra ?x M M ?y))
)
(defrule z-bbm
	?p <- (palabra $?x Z $?y)
	=>
	(retract ?p)
	(assert (palabra ?x B B M ?y))
)