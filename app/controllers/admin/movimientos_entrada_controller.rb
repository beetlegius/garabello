module Admin
  class MovimientosEntradaController < MovimientosController

    def index
      @movimiento = MovimientoEntrada.new
      set_variables title: 'Entradas', description: 'Entrada de productos'

      respond_to do |format|
        format.html
        format.csv  { send_data MovimientoEntrada.to_csv, filename: 'entradas.csv' }
        format.json { render json: MovimientosEntradaDatatable.new(view_context) }
      end
    end

    private

    def set_autocomplete_url
      @autocomplete_url ||= autocomplete_admin_productos_url
    end
  end
end
