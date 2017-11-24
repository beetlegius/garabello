module Admin
  class RecursosController < BaseController
    load_and_authorize_resource

    def index
      respond_to do |format|
        format.html
        format.json { render json: RecursosDatatable.new(view_context) }
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
      @recurso.save!
      redirect_to edit_admin_recurso_path(@recurso), notice: t(action_name, scope: :notice)
    end

    def update
      @recurso.update! recurso_params
      redirect_to [:edit, :admin, @recurso], notice: t(action_name, link: view_context.link_to('Volver', admin_recursos_path), scope: :notice)
    end

    def destroy
      if @recurso.destroy
        redirect_to admin_recursos_path, notice: t(action_name, scope: :notice)
      else
        redirect_to admin_recursos_path, alert: t(action_name, scope: :alert)
      end
    end

    private

    def recurso_params
      params.require(:recurso).permit(:nombre, :unidad)
    end

  end
end
