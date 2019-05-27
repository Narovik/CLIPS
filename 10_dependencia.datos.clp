(deftemplate Producto
	(field CodigoVendedor)
	(field CodigoProducto)
	(field PVPProducto))
	
(deffacts iniciales
	(dependientes )
	(Producto
		(CodigoVendedor 1)
		(CodigoProducto id1)
		(PVPProducto 10e)
	)
		(Producto
		(CodigoVendedor 1)
		(CodigoProducto id2)
		(PVPProducto 20e)
	)
		(Producto
		(CodigoVendedor 1)
		(CodigoProducto id3)
		(PVPProducto 30e)
	)
		(Producto
		(CodigoVendedor 2)
		(CodigoProducto id1)
		(PVPProducto 10e)
	)
		(Producto
		(CodigoVendedor 1)
		(CodigoProducto id2)
		(PVPProducto 20e)
	)
		(Producto
		(CodigoVendedor 2)
		(CodigoProducto id4)
		(PVPProducto 40e)
	)
		(Producto
		(CodigoVendedor 3)
		(CodigoProducto id1)
		(PVPProducto 10e)
	)
		(Producto
		(CodigoVendedor 3)
		(CodigoProducto id4)
		(PVPProducto 40e)
	)
)