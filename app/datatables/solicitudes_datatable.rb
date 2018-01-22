class SolicitudesDatatable < ApplicationDatatable

  private

  def data
    solicitudes.map do |solicitud|
      [].tap do |column|
        column << solicitud.fecha
        column << solicitud.codigo
        column << solicitud.codigo_requerimiento
        column << solicitud.lugar
        column << solicitud.estado_label
        column << solicitud.urgencia_label
        column << @view.link_to(solicitud.items_label, @view.items_admin_solicitud_path(solicitud), remote: true)
        column << @view.link_to(solicitud.novedades_label, @view.novedades_admin_solicitud_path(solicitud), remote: true)

        links = []
        links.push @view.link_to('Ver detalle', @view.admin_solicitud_path(solicitud), class: 'btn btn-xs btn-flat bg-purple')
        links.push @view.link_to('Editar', @view.edit_admin_solicitud_path(solicitud), class: 'btn btn-xs btn-flat btn-info')
        links.push @view.link_to('Eliminar', @view.admin_solicitud_path(solicitud), method: :delete, class: 'btn btn-xs btn-flat btn-danger', data: { confirm: @view.t(:confirm) })
        column << @view.tag.div(links.join.html_safe, class: 'btn-group pull-right')
      end
    end
  end

  def count
    solicitudes.count
  end

  def total_entries
    solicitudes.count
  end

  def solicitudes
    @solicitudes ||= Solicitud.includes(items: :producto).search(params[:q]).result(distinct: true).decorate
  end

end
