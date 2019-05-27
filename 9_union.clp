(defrule datos
	=>
	(assert (cadena B C A D E E B C E))
	(assert (cadena E E B F D E))
	(assert (resultado))
)
(defrule union
	(cadena $? ?x $?) 
	(not (resultado $? ?x $?))
	?h <- (resultado $?r)
	=>
	(retract ?h)
	(assert (resultado $?r ?x)))