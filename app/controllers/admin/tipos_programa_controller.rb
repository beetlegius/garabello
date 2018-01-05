module Admin
  class TiposProgramaController < BaseController
    load_and_authorize_resource

    def index
      respond_to do |format|
        format.html
        format.json { render json: TiposProgramaDatatable.new(view_context) }
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
      @tipo_programa.save!
      redirect_to edit_admin_tipo_programa_path(@tipo_programa), notice: t(action_name, scope: :notice)
    end

    def update
      @tipo_programa.update! tipo_programa_params
      redirect_to [:edit, :admin, @tipo_programa], notice: t(action_name, link: view_context.link_to('Volver', admin_tipos_programa_path), scope: :notice)
    end

    def destroy
      if @tipo_programa.destroy
        redirect_to admin_tipos_programa_path, notice: t(action_name, scope: :notice)
      else
        redirect_to admin_tipos_programa_path, alert: t(action_name, scope: :alert)
      end
    end

    private

    def tipo_programa_params
      params.require(:tipo_programa).permit(:nombre, tarea_ids: [], recurso_ids: [])
    end

  end
end
