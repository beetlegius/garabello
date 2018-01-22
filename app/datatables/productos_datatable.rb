class ProductosDatatable < ApplicationDatatable

  private

  def data
    productos.map do |producto|
      [].tap do |column|
        column << producto.codigo
        column << @view.number_with_precision(producto.cantidad)
        column << producto.unidad
        column << producto.nombre
        column << producto.nombre_planilla
        links = []
        links.push @view.link_to('Editar', @view.edit_admin_producto_path(producto), class: 'btn btn-xs btn-flat btn-info', target: :_blank)
        links.push @view.link_to(producto.esta_seleccionado? ? 'Seleccionado' : 'Seleccionar', @view.toggle_admin_producto_path(producto, atributo: :esta_seleccionado), class: ['btn', 'btn-xs', (producto.esta_seleccionado? ? 'bg-olive' : 'btn-default')], data: { method: :patch, remote: true })
        column << @view.tag.div(links.join.html_safe, class: 'btn-group pull-right')
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
    @productos ||= Producto.search(params[:q]).result(distinct: true)
  end

end
