class MovimientosEntradaDatatable < MovimientosDatatable

  private

  def movimientos
    @movimientos ||= MovimientoEntrada.all
  end

end
