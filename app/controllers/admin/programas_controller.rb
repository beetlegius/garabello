module Admin
  class ProgramasController < BaseController
    load_and_authorize_resource

    def index
      @q = Programa.search params[:q]
      respond_to do |format|
        format.html
        format.js
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
      params.require(:programa).permit(:periodo, :capataz, :inspector, :dotacion_original, :dotacion_real, :observaciones, :via_id, :cuadrilla_id,
        jornadas_attributes: [:id, :fecha, :km_desde, :km_hasta],
        trabajos_pam_attributes: [:id, :fecha, :tarea_id, :km_desde, :km_hasta, :cantidad_estimada, :cantidad_ejecutada, :jornada_id, :_destroy],
        trabajos_pat_attributes: [:id, :fecha, :tarea_id, :km_desde, :km_hasta, :cantidad_estimada, :cantidad_ejecutada, :jornada_id, :_destroy],
        trabajos_fp_attributes: [:id, :fecha, :tarea_id, :km_desde, :km_hasta, :cantidad_ejecutada, :jornada_id, :_destroy],
        consumos_attributes: [:id, :fecha, :cantidad, :km_desde, :km_hasta, :recurso_id, :_destroy],
        asistencias_attributes: [:id, :estado, :recargo_horas])
    end

  end
end
