(deftemplate FichaPaciente
	(field Nombre)
	(field Casado)
	(field Edad)
	(field Sexo)
	(field Peso)
)
	
(deftemplate DatosExploracion
	(field Nombre)
	(multifield Sintomas)
	(field GravedadAfeccion)
)
	
(deftemplate Diagnostico
	(field Nombre)
	(field Resultado)
	(field ProximaRevision (default no))
)

(deftemplate Terapia
	(field Nombre)
	(field PrincipioActivo)
	(field Posologia)
)


(defrule DiagnosticoEccema
	(DatosExploracion (Nombre ?N) (Sintomas $?sintomas))
	(FichaPaciente (Nombre ?N))
	(test (subsetp (create$ picor vesiculas) $?sintomas)) ;comprueba sin importar orden
	=>
	(printout t "Posible diagnostico para el paciente " ?N ": Eccema " crlf)
	(assert (Diagnostico (Nombre ?N) (Resultado eccema)))
)


(defrule MostrarDiagnostico
	(Diagnostico (Nombre ?N) (Resultado ?R) (ProximaRevision ?PR))
	=>
	(printout t "Diagnostico de " ?R ". Paciente: " ?N " Revision: " ?PR crlf)
)

(defrule Es_bebe
	(declare (salience 100)) ;Darle prioridad 
	(FichaPaciente (Nombre ?N) (Edad ?E))
	(test (< ?E 2))
	=>
	(assert (Paciente ?N Es_Un_bebe))
)

(defrule DarCorticoidesAdulto
	(Diagnostico (Nombre ?N) (Resultado eccema))
	(not (Paciente ?N Es_Un_bebe)) 
	=>
	(assert (Terapia (Nombre ?N) (PrincipioActivo corticoides)))
	(printout t "Terapia para " ?N ": corticoides" crlf))
)

(defrule DarCorticoidesBebe
	(Diagnostico (Nombre ?N) (Resultado eccema))
	(Paciente ?N Es_Un_bebe) 
	(DatosExploracion (Nombre ?N) (GravedadAfeccion muy_Grave))
	=>
	(assert (Terapia (Nombre ?N) (PrincipioActivo corticoides)))
	(printout t "Terapia para " ?N ": corticoides" crlf))
)

(defrule DarCrema
	(Diagnostico (Nombre ?N) (Resultado eccema))
	(Paciente ?N Es_Un_bebe)
	(DatosExploracion (Nombre ?N) (GravedadAfeccion ~muy_Grave))
	=>
	(assert (Terapia (Nombre ?N) (PrincipioActivo crema_Hidratante)))
	(printout t "Terapia para " ?N ": crema hidratante" crlf)
)
	
		

		