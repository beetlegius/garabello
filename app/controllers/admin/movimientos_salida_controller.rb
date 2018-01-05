module Admin
  class MovimientosSalidaController < MovimientosController

    def index
      @movimiento = MovimientoSalida.new
      set_variables title: 'Salidas', description: 'Salida de productos'

      respond_to do |format|
        format.html
        format.csv  { send_data MovimientoSalida.to_csv, filename: 'salidas.csv' }
        format.json { render json: MovimientosSalidaDatatable.new(view_context) }
      end
    end

    private

    def set_autocomplete_url
      @autocomplete_url ||= autocomplete_admin_productos_url(disponible: true)
    end
  end
end
