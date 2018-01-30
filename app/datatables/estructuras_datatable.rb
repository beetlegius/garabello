class EstructurasDatatable < ApplicationDatatable

  private

  def data
    estructuras.map do |estructura|
      [].tap do |column|
        column << estructura.id
        column << @view.number_with_precision(estructura.km)
        column << @view.fa_icon(:train, class: 'fa-fw', text: estructura.ramal&.nombre)

        links = []
        links.push @view.link_to('Detalle', @view.url_for([:admin, estructura]), class: 'btn btn-xs btn-flat bg-purple')
        links.push @view.link_to('Editar', @view.url_for([:edit, :admin, estructura]), class: 'btn btn-xs btn-flat btn-info')
        links.push @view.link_to('Eliminar', @view.url_for([:admin, estructura]), method: :delete, class: 'btn btn-xs btn-flat btn-danger', data: { confirm: @view.t(:confirm) }) if estructura.can_delete? && @view.can?(:destroy, estructura)
        column << @view.tag.div(links.join.html_safe, class: 'btn-group pull-right')
      end
    end
  end

  def count
    estructuras.count
  end

  def total_entries
    estructuras.count
  end

  def estructuras
    @estructuras ||= Estructura.includes(:ramal).search(params[:q]).result(distinct: true)
  end

end
