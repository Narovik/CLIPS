(deftemplate Persona
	(field Nombre)
	(field Edad)
	(field NombreConyuge)
	(field PosicionEconomica)
	(field Salario)
)

(deffacts HechosIniciales
	(Persona 
		(Nombre Pepe)
		(Salario 1500)
		(Edad 40)
		(NombreConyuge Marta)
		(PosicionEconomica desahogada))
	(Persona 
		(Nombre Jose)
		(Salario 2000)
		(Edad 40)
		(NombreConyuge Ana)
		(PosicionEconomica desahogada))
	(Persona 
		(Nombre Paco)
		(Salario 700)
		(Edad 40)
		(NombreConyuge Juana)
		(PosicionEconomica ahogada))
	(Persona 
		(Nombre Marta)
		(Salario 600)
		(Edad 60)
		(NombreConyuge Pepe)
		(PosicionEconomica ahogada))
	(Persona 
		(Nombre Ana)
		(Salario 1000)
		(Edad 60)
		(NombreConyuge Jose)
		(PosicionEconomica desahogada))
	(Persona 
		(Nombre Juana)
		(Salario 200)
		(Edad 60)
		(NombreConyuge Paco)
		(PosicionEconomica ahogada))
)


defrule Tiene60
(Persona
(Nombre ?N)
(Edad 60))
=>
(printout t  ?N "tiene 60 años"  crlf)
)
(defrule Tiene40
(Persona
(Nombre ?N)
(Salario ?S)
(Edad 40))
=>
(printout t  ?N "tiene 40 años y cobra " ?S "€" crlf)
)

(defrule MostrarTodos
(Persona
(Nombre ?N)
(Salario ?S)
(Edad ?E)
(NombreConyuge ?NC)
(PosicionEconomica ?P))
=>
(printout t  ?N "-" ?E "-" ?NC "-" ?P "-" ?S crlf)
)
(defrule desahogada
(Persona
	(Nombre ?N)
	(NombreConyuge ?NC))
(Persona
	(Nombre ?NC)
	(PosicionEconomica desahogada))
=>
(printout t "El conyuge de" ?N "tiene una pos desahogada"  crlf)
)

(defrule DatosFiscales
(Persona
	(Nombre ?N)
	(NombreConyuge ?NC))
(Persona
	(Nombre ?NC)
	(PosicionEconomica desahogada))
=>
(assert(Datosfiscales ?N ConyugeDesahogado))
)

(defrule BorraDatosFiscales
(Datosfiscales ?N ConyugeDesahogado)
?Borrar <- (Persona(Nombre ?N))
=>
(retract ?Borrar)
)

(defrule Borradeshaogada
(Persona
(Nombre ?N)
(PosicionEconomica desahogada))
?Borrar <- (Persona(Nombre ?N))
=>
(retract ?Borrar)
)