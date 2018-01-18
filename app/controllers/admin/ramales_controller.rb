module Admin
  class RamalesController < BaseController
    load_and_authorize_resource

    def index
      respond_to do |format|
        format.html
        format.json { render json: RamalesDatatable.new(view_context) }
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
      @ramal.save!
      redirect_to edit_admin_ramal_path(@ramal), notice: t(action_name, scope: :notice)
    end

    def update
      @ramal.update! ramal_params
      redirect_to [:edit, :admin, @ramal], notice: t(action_name, link: view_context.link_to('Volver', admin_ramales_path), scope: :notice)
    end

    def destroy
      if @ramal.destroy
        redirect_to admin_ramales_path, notice: t(action_name, scope: :notice)
      else
        redirect_to admin_ramales_path, alert: t(action_name, scope: :alert)
      end
    end

    private

    def ramal_params
      params.require(:ramal).permit(:nombre)
    end

  end
end
