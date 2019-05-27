; Autor: Víctor Manuel Rodríguez Navarro
; Fecha: 23/05/19
(defrule datos
	=>
	(assert (vector 5 3 1 3 2))
)
(defrule minimo
	(vector $? ?x $?) 
	(not (vector $? ?y&:(< ?y ?x) $?))
	=>
	(printout t "El minimo es " ?x crlf))
