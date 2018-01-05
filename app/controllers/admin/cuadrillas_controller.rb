module Admin
  class CuadrillasController < BaseController
    load_and_authorize_resource

    def index
      respond_to do |format|
        format.html
        format.json { render json: CuadrillasDatatable.new(view_context) }
      end
    end

    def show
    end

    def new
      render :form
    end

    def edit
      render :form
    end

    def create
      @cuadrilla.save!
      redirect_to edit_admin_cuadrilla_path(@cuadrilla), notice: t(action_name, scope: :notice)
    end

    def update
      @cuadrilla.update! cuadrilla_params
      redirect_to [:edit, :admin, @cuadrilla], notice: t(action_name, link: view_context.link_to('Volver', admin_cuadrillas_path), scope: :notice)
    end

    def destroy
      if @cuadrilla.destroy
        redirect_to admin_cuadrillas_path, notice: t(action_name, scope: :notice)
      else
        redirect_to admin_cuadrillas_path, alert: t(action_name, scope: :alert)
      end
    end

    private

    def cuadrilla_params
      params.require(:cuadrilla).permit(:nombre, :sector)
    end

  end
end
