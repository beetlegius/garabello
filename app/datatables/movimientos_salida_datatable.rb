class MovimientosSalidaDatatable < MovimientosDatatable

  private

  def movimientos
    @movimientos ||= MovimientoSalida.all
  end

end
