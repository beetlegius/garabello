module Admin
  class EmpleadosController < BaseController
    load_and_authorize_resource

    def index
      respond_to do |format|
        format.html
        format.json { render json: EmpleadosDatatable.new(view_context) }
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
      @empleado.save!
      redirect_to edit_admin_empleado_path(@empleado), notice: t(action_name, scope: :notice)
    end

    def update
      @empleado.update! empleado_params
      redirect_to [:edit, :admin, @empleado], notice: t(action_name, link: view_context.link_to('Volver', admin_empleados_path), scope: :notice)
    end

    def destroy
      if @empleado.destroy
        redirect_to admin_empleados_path, notice: t(action_name, scope: :notice)
      else
        redirect_to admin_empleados_path, alert: t(action_name, scope: :alert)
      end
    end

    private

    def empleado_params
      params.require(:empleado).permit(:nombre, :apellido, :cuadrilla_id)
    end

  end
end
