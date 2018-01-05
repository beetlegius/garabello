class RecursosDatatable < ApplicationDatatable

  private

  def data
    recursos.map do |recurso|
      [].tap do |column|
        column << recurso.id
        column << recurso.nombre
        column << recurso.unidad.humanize

        links = []
        links.push @view.link_to('Editar', @view.edit_admin_recurso_path(recurso), class: 'btn btn-xs btn-flat btn-info')
        links.push @view.link_to('Eliminar', @view.admin_recurso_path(recurso), method: :delete, class: 'btn btn-xs btn-flat btn-danger', data: { confirm: @view.t(:confirm) })
        column << @view.tag.div(links.join.html_safe, class: 'btn-group pull-right')
      end
    end
  end

  def count
    recursos.count
  end

  def total_entries
    recursos.count
  end

  def recursos
    @recursos ||= Recurso.all
  end

end
