module Admin
  class TareasController < BaseController
    load_and_authorize_resource

    def index
      respond_to do |format|
        format.html
        format.json { render json: TareasDatatable.new(view_context) }
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
      @tarea.save!
      redirect_to edit_admin_tarea_path(@tarea), notice: t(action_name, scope: :notice)
    end

    def update
      @tarea.update! tarea_params
      redirect_to [:edit, :admin, @tarea], notice: t(action_name, link: view_context.link_to('Volver', admin_tareas_path), scope: :notice)
    end

    def destroy
      if @tarea.destroy
        redirect_to admin_tareas_path, notice: t(action_name, scope: :notice)
      else
        redirect_to admin_tareas_path, alert: t(action_name, scope: :alert)
      end
    end

    private

    def tarea_params
      params.require(:tarea).permit(:nombre, :unidad)
    end

  end
end
