class TiposProgramaDatatable < ApplicationDatatable

  private

  def data
    tipos_programa.map do |tipo_programa|
      [].tap do |column|
        column << tipo_programa.id
        column << tipo_programa.nombre

        links = []
        links.push @view.link_to('Editar', @view.edit_admin_tipo_programa_path(tipo_programa), class: 'btn btn-xs btn-flat btn-info')
        links.push @view.link_to('Eliminar', @view.admin_tipo_programa_path(tipo_programa), method: :delete, class: 'btn btn-xs btn-flat btn-danger', data: { confirm: @view.t(:confirm) })
        column << @view.tag.div(links.join.html_safe, class: 'btn-group pull-right')
      end
    end
  end

  def count
    tipos_programa.count
  end

  def total_entries
    tipos_programa.count
  end

  def tipos_programa
    @tipos_programa ||= TipoPrograma.all
  end

end
