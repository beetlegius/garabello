module Admin
  class ProductosController < BaseController
    load_and_authorize_resource

    def index
      set_variables 'Inventario', 'Inventario de productos'
      params[:q] ||= { cantidad_gt: 0 }

      respond_to do |format|
        format.html
        format.json { render json: ProductosDatatable.new(view_context) }
      end
    end

    def filtrado
      @q = @productos.search params[:q]
      @productos = @q.result(distinct: true)
    end

    def edit
      render :form
    end

    def update
      @producto.update! producto_params
      redirect_to edit_admin_producto_path(@producto)
    end

    def toggle
      @producto.toggle! params[:atributo] if @producto.respond_to?(params[:atributo])

      respond_to do |format|
        format.html { redirect_back fallback_location: filtrado_admin_productos_path, notice: t(action_name, scope: :notice) }
        format.js
      end
    end

    def autocomplete
      render json: Autocomplete::Productos.new(view_context)
    end

    def stock
      send_data Producto.disponible.to_csv, filename: "stock-#{Date.today.strftime '%d-%m-%Y'}.csv"
    end

    private

    def producto_params
      params.require(:producto).permit(:nombre_planilla)
    end

  end
end
