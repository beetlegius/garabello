module Admin
  class ProgramasController < BaseController
    load_and_authorize_resource

    def index
      respond_to do |format|
        format.html
        format.json { render json: ProgramasDatatable.new(view_context) }
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
      @programa.save!
      redirect_to edit_admin_programa_path(@programa), notice: t(action_name, scope: :notice)
    end

    def update
      @programa.update! programa_params
      redirect_to [:edit, :admin, @programa], notice: t(action_name, link: view_context.link_to('Volver', admin_programas_path), scope: :notice)
    end

    def destroy
      if @programa.destroy
        redirect_to admin_programas_path, notice: t(action_name, scope: :notice)
      else
        redirect_to admin_programas_path, alert: t(action_name, scope: :alert)
      end
    end

    private

    def programa_params
      params.require(:programa).permit(:desde, :hasta, :capataz, :inspector, :estimado_ayudante, :estimado_operario, :real_ayudante, :real_operario, :via_id, :cuadrilla_id, trabajos_attributes: [:id, :_destroy], consumos_attributes: [:id, :_destroy], asistencias_attributes: [:id, :_destroy])
    end

  end
end
