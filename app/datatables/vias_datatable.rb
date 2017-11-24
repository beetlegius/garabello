class ViasDatatable < ApplicationDatatable

  private

  def data
    vias.map do |via|
      [].tap do |column|
        column << via.id
        column << via.nombre

        links = []
        links.push @view.link_to('Editar', @view.edit_admin_via_path(via), class: 'btn btn-xs btn-info')
        links.push @view.link_to('Eliminar', @view.admin_via_path(via), method: :delete, class: 'btn btn-xs btn-danger', data: { confirm: @view.t(:confirm) })
        column << @view.tag.div(links.join.html_safe, class: 'btn-group pull-right')
      end
    end
  end

  def count
    vias.count
  end

  def total_entries
    vias.count
  end

  def vias
    @vias ||= Via.all
  end

end
