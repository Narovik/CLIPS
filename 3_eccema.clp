; Autor: Víctor Manuel Rodríguez Navarro
; Fecha: 22/05/19
(deftemplate FichaPaciente
	(field Nombre)
	(field Casado)
	(field Direccion))
(deftemplate DatosExploracion
	(field Nombre)
	(multifield Sintomas)
	(field GravedadAfeccion))
(defrule DiagnosticoEccema
	(DatosExploracion
	(Nombre ?N)
	(Sintomas $? picor vesiculas $?))
	(FichaPaciente
	(Nombre ?N))
	=>
	(printout t "Posible diagnóstico para el paciente " ?N ": Eccema " crlf)
)

	