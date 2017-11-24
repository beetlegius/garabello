class ProgramasDatatable < ApplicationDatatable

  private

  def data
    programas.map do |programa|
      [].tap do |column|
        column << programa.id
        column << @view.date(programa.desde)
        column << @view.date(programa.hasta)
        column << programa.cuadrilla&.nombre
        column << programa.via&.nombre
        column << programa.capataz
        column << programa.inspector

        links = []
        links.push @view.link_to('Detalle', @view.admin_programa_path(programa), class: 'btn btn-xs bg-purple')
        links.push @view.link_to('Editar', @view.edit_admin_programa_path(programa), class: 'btn btn-xs btn-info')
        links.push @view.link_to('Eliminar', @view.admin_programa_path(programa), method: :delete, class: 'btn btn-xs btn-danger', data: { confirm: @view.t(:confirm) })
        column << @view.tag.div(links.join.html_safe, class: 'btn-group pull-right')
      end
    end
  end

  def count
    programas.count
  end

  def total_entries
    programas.count
  end

  def programas
    @programas ||= Programa.includes(:cuadrilla, :via)
  end

end
