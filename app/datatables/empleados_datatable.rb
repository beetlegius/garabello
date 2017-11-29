class EmpleadosDatatable < ApplicationDatatable

  private

  def data
    empleados.map do |empleado|
      [].tap do |column|
        column << empleado.id
        column << empleado.cuadrilla&.nombre
        column << empleado.nombre
        column << empleado.apellido

        links = []
        links.push @view.link_to('Editar', @view.edit_admin_empleado_path(empleado), class: 'btn btn-xs btn-flat btn-info')
        links.push @view.link_to('Eliminar', @view.admin_empleado_path(empleado), method: :delete, class: 'btn btn-xs btn-flat btn-danger', data: { confirm: @view.t(:confirm) })
        column << @view.tag.div(links.join.html_safe, class: 'btn-group pull-right')
      end
    end
  end

  def count
    empleados.count
  end

  def total_entries
    empleados.count
  end

  def empleados
    @empleados ||= Empleado.includes(:cuadrilla)
  end

end
