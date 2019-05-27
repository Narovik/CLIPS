(deftemplate Articulo
	(field Nombre)
	(field Tipo (allowed-values fragil pesado)) ; Valores permitidos: fragil, pesado
	(field Forrado (allowed-values Si No) (default No)) ; Valores permitidos Si - No
	(field Empaquetado (allowed-values Si No) (default No))   ; Valores permitidos Si - No
	(field Dimension (type INTEGER) (range 0 200)) ; Valor numérico de 0 a 200
)
(deftemplate Caja
	(field IdCaja)
	(field Abierta (allowed-values Si No)(default No)) ; Valores permitidos Si - No
	(field Empezada (allowed-values Si No)(default No)) ; Valores permitidos Si - No
	(field TipoContenido (allowed-values fragil pesado)) ; Valores permitidos: fragil, pesado
	(field EspacioLibre (range 0 ?VARIABLE) (type INTEGER)) ; Valor numérico que indica
							; el espacio que todavía queda libre.
							; Al principio, contiene la dimensión
							; de la caja. Viene en las mismas
							; unidades que el field dimensión
							; del template Articulo.
							)
(deffacts articulos
	(Articulo
		(Nombre Movil)
		(Tipo fragil)
		(Dimension 10)
	)
	(Articulo
		(Nombre Cristal)
		(Tipo fragil)
		(Dimension 150)
	)
	(Articulo
		(Nombre Reloj)
		(Tipo fragil)
		(Dimension 5)
	)
	(Articulo
		(Nombre Mesa)
		(Tipo pesado)
		(Dimension 100)
	)
	(Articulo
		(Nombre Silla)
		(Tipo pesado)
		(Dimension 50)
	)
	(Articulo
		(Nombre Cama)
		(Tipo pesado)
		(Dimension 200)
	)
)
(deffacts cajas
	(Caja
		(IdCaja caja1)
		(EspacioLibre 20)
	)
	(Caja
		(IdCaja caja2)
		(EspacioLibre 200)
	)
	(Caja
		(IdCaja caja3)
		(EspacioLibre 200)
	)
	(Caja
		(IdCaja caja4)
		(EspacioLibre 50)
	)
	(Caja
		(IdCaja caja5)
		(EspacioLibre 10)
	)
)