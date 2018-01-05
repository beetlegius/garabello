module MovimientosHelper

  def movimiento_label(movimiento)
    case movimiento.estado
    when Movimiento::CONFIRMADA
      tag.label('Confirmada', class: 'label label-success text-uppercase')
    when Movimiento::PENDIENTE
      tag.label('Pendiente', class: 'label label-warning text-uppercase')
    end
  end

end
