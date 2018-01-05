module Admin
  class ProductosController < BaseController
    load_and_authorize_resource

    def index
      set_variables 'Inventario', 'Inventario de productos'

      respond_to do |format|
        format.html
        format.json { render json: ProductosDatatable.new(view_context) }
      end
    end

    def autocomplete
      render json: Autocomplete::Productos.new(view_context)
    end

    def stock
      send_data Producto.disponible.to_csv, filename: "stock-#{Date.today.strftime '%d-%m-%Y'}.csv"
    end

  end
end
