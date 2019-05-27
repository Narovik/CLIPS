; Autor: Víctor Manuel Rodríguez Navarro
; Fecha: 25/05/19
(deftemplate Pais
	(field Nombre)
	(multifield Bandera)
)

(deffacts paises
	(Pais
		(Nombre Vaticano) 
		(Bandera blanco amarillo))
	(Pais 
		(Nombre Brunei) 
		(Bandera amarillo blanco negro rojo))
	(Pais 
		(Nombre España) 
		(Bandera rojo amarillo rojo))
	(Pais 
		(Nombre Ghana) 
		(Bandera rojo amarillo verde))
	(ColoresABuscar blanco amarillo)
)

(defrule Ordenar
	(ColoresABuscar $?c)
	(Pais 
		(Nombre ?n) 
		(Bandera $?bandera)
	)
	(test (subsetp $?c $?bandera))
    =>
    (printout t "El pais " ?n " tiene los colores: " $?c crlf)
)