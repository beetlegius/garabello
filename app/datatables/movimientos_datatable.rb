class MovimientosDatatable < ApplicationDatatable

  private

  def data
    movimientos.map do |movimiento|
      [].tap do |column|
        column << @view.l(movimiento.fecha)
        column << movimiento.user.to_label
        column << movimiento.items_count
        column << movimiento.remito
        column << @view.movimiento_label(movimiento)

        links = []
        links.push @view.link_to('Confirmar', @view.url_for([:confirmar, :admin, movimiento]), method: :patch, class: 'btn btn-xs btn-success', data: { confirm: @view.t(:confirmacion) }) if movimiento.se_puede_confirmar?
        links.push @view.link_to('Editar', @view.url_for([:edit, :admin, movimiento]), class: 'btn btn-xs btn-info') if !movimiento.esta_confirmado?
        links.push @view.link_to('Eliminar', @view.url_for([:admin, movimiento]), method: :delete, class: 'btn btn-xs btn-danger', data: { confirm: @view.t(:confirmacion) }) if movimiento.can_delete? && @view.can?(:destroy, movimiento)
        links.push @view.link_to(@view.fa_icon(:print, class: 'fa-fw', text: 'Imprimir'), @view.url_for([:admin, movimiento]), class: 'btn btn-xs bg-purple', target: :_blank) if movimiento.esta_confirmado?
        column << @view.tag.div(links.join.html_safe, class: 'btn-group pull-right')
      end
    end
  end

  def count
    movimientos.count
  end

  def total_entries
    movimientos.count
  end

end
