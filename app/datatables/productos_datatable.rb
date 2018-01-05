class ProductosDatatable < ApplicationDatatable

  private

  def data
    productos.map do |producto|
      [].tap do |column|
        column << producto.codigo
        column << @view.number_with_precision(producto.cantidad)
        column << producto.unidad
        column << producto.nombre
      end
    end
  end

  def count
    productos.count
  end

  def total_entries
    productos.count
  end

  def productos
    @productos ||= Producto.disponible
  end

end
