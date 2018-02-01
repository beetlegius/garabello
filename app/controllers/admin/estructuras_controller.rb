module Admin
  class EstructurasController < BaseController
    load_and_authorize_resource instance_name: :estructura, param_method: :estructura_params

    def index
      @q = Estructura.search params[:q]
      respond_to do |format|
        format.html
        format.js
        format.json { render json: EstructurasDatatable.new(view_context) }
      end
    end

    def show
      redirect_to [:admin, @estructura.relevamientos.first] if @estructura.relevamientos.any?
    end

    def new
      render :form
    end

    def edit
      render :form
    end

    def create
      @estructura.save!
      redirect_to [:edit, :admin, @estructura], notice: t(action_name, scope: :notice)
    end

    def update
      @estructura.update! estructura_params
      redirect_to [:edit, :admin, @estructura], notice: t(action_name, link: view_context.link_to('Volver', admin_estructuras_path), scope: :notice)
    end

    def destroy
      if @estructura.destroy
        redirect_to admin_estructuras_path, notice: t(action_name, scope: :notice)
      else
        redirect_to admin_estructuras_path, alert: t(action_name, scope: :alert)
      end
    end

    private

    def estructura_params
      params.require(:estructura).permit(:km, :tipo, :partido, :localidad, :cantidad_tableros, :tipo_tablero, :material_tableros, :material_estribos, :material_pilares, :estacion_anterior_id, :estacion_siguiente_id, :ramal_id)
    end

  end
end
