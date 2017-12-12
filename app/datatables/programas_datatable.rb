class ProgramasDatatable < ApplicationDatatable

  private

  def data
    programas.map do |programa|
      [].tap do |column|
        column << programa.id
        column << programa.tipo_programa.nombre
        column << @view.fa_icon(:calendar, class: 'fa-fw', text: @view.date(programa.desde))
        column << @view.fa_icon(:calendar, class: 'fa-fw', text: @view.date(programa.hasta))
        column << @view.fa_icon(:wrench, class: 'fa-fw', text: programa.cuadrilla&.nombre)
        column << @view.fa_icon(:train, class: 'fa-fw', text: programa.via&.nombre)
        column << @view.fa_icon(:user, class: 'fa-fw', text: programa.capataz)
        column << @view.fa_icon('user-secret', class: 'fa-fw', text: programa.inspector)
        column << @view.tag.span(@view.fa_icon(:users, class: 'fa-fw', text: "#{programa.dotacion_real}/#{programa.dotacion_original}"), title: ('La dotación real no coincide con la original' unless programa.dotacion_correcta?), class: ('text-danger' unless programa.dotacion_correcta?))

        links = []
        links.push @view.link_to('Detalle', @view.admin_programa_path(programa), class: 'btn btn-xs btn-flat bg-purple')
        links.push @view.link_to('Editar', @view.edit_admin_programa_path(programa), class: 'btn btn-xs btn-flat btn-info')
        links.push @view.link_to('Eliminar', @view.admin_programa_path(programa), method: :delete, class: 'btn btn-xs btn-flat btn-danger', data: { confirm: @view.t(:confirm) })
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
    @programas ||= Programa.includes(:cuadrilla, :via).search(params[:q]).result(distinct: true)
  end

end
