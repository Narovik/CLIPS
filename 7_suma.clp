; Autor: Víctor Manuel Rodríguez Navarro
; Fecha: 23/05/19
(defrule datos
	=>
	(assert (vector 5 3 1 3 2))
)
(defrule inicial
(vector $?x)
=>
(assert (aux $?x))
(assert (suma 0))
)

(defrule Sumatoria
	?v_aux <- (aux $?a ?x $?b)
	?suma <- (suma ?total)
	=>
	(retract ?suma ?v_aux)
	(assert (aux $?a $?b))
	(bind ?sub-total (+ ?x ?total))
	(assert (suma ?sub-total))
	(printout t "Suma Parcial="?sub-total crlf)
	)

(defrule final
(not (aux ?))
(suma ?rel)
=>
(printout t "La suma total es:" ?rel crlf)

)

