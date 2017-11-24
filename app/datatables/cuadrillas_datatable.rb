class CuadrillasDatatable < ApplicationDatatable

  private

  def data
    cuadrillas.map do |cuadrilla|
      [].tap do |column|
        column << cuadrilla.id
        column << cuadrilla.nombre

        links = []
        links.push @view.link_to('Editar', @view.edit_admin_cuadrilla_path(cuadrilla), class: 'btn btn-xs btn-info')
        links.push @view.link_to('Eliminar', @view.admin_cuadrilla_path(cuadrilla), method: :delete, class: 'btn btn-xs btn-danger', data: { confirm: @view.t(:confirm) })
        column << @view.tag.div(links.join.html_safe, class: 'btn-group pull-right')
      end
    end
  end

  def count
    cuadrillas.count
  end

  def total_entries
    cuadrillas.count
  end

  def cuadrillas
    @cuadrillas ||= Cuadrilla.all
  end

end
