class RamalesDatatable < ApplicationDatatable

  private

  def data
    ramales.map do |ramal|
      [].tap do |column|
        column << ramal.id
        column << ramal.nombre

        links = []
        links.push @view.link_to('Editar', @view.edit_admin_ramal_path(ramal), class: 'btn btn-xs btn-flat btn-info')
        links.push @view.link_to('Eliminar', @view.admin_ramal_path(ramal), method: :delete, class: 'btn btn-xs btn-flat btn-danger', data: { confirm: @view.t(:confirm) })
        column << @view.tag.div(links.join.html_safe, class: 'btn-group pull-right')
      end
    end
  end

  def count
    ramales.count
  end

  def total_entries
    ramales.count
  end

  def ramales
    @ramales ||= Ramal.all
  end

end
