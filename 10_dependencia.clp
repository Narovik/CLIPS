(defrule HayDependencia
		(Producto (CodigoProducto ?id1)  (PVPProducto ?p1) (CodigoVendedor ?v1))
		(Producto (CodigoProducto ?id1)  (PVPProducto ?p1) (CodigoVendedor ?v2))
		(test (<> ?v1 ?v2))
		(not (dependientes $? ?id1 $?))
		?h <- (dependientes $?c)
	=>
		(retract ?h)
		(assert (dependientes $?c ?id1))
		(printout t  "DEPENDENCIA " ?id1 " y " ?p1 crlf)
)

	