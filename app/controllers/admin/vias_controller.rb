module Admin
  class ViasController < BaseController
    load_and_authorize_resource

    def index
      respond_to do |format|
        format.html
        format.json { render json: ViasDatatable.new(view_context) }
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
      @via.save!
      redirect_to edit_admin_via_path(@via), notice: t(action_name, scope: :notice)
    end

    def update
      @via.update! via_params
      redirect_to [:edit, :admin, @via], notice: t(action_name, link: view_context.link_to('Volver', admin_vias_path), scope: :notice)
    end

    def destroy
      if @via.destroy
        redirect_to admin_vias_path, notice: t(action_name, scope: :notice)
      else
        redirect_to admin_vias_path, alert: t(action_name, scope: :alert)
      end
    end

    private

    def via_params
      params.require(:via).permit(:nombre)
    end

  end
end
