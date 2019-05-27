(defrule datos
	=>
	(assert (vector 5 3 1 3 2))
)
(defrule minimo
	(vector $? ?x $?) 
	(not (vector $? ?y&:(< ?y ?x) $?))
	=>
	(printout t "El minimo es " ?x crlf))
