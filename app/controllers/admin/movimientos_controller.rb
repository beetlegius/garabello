module Admin
  class MovimientosController < BaseController
    load_and_authorize_resource instance_name: :movimiento, param_method: :movimiento_params
    before_action :proteger, only: %w(edit update)
    before_action :set_autocomplete_url, only: %w(edit update)

    def show
      render layout: 'print'
    end

    def new
      render :form
    end

    def edit
      @movimiento.items.build if @movimiento.items.empty?
      render :form
    end

    def create
      @movimiento.user = current_user
      @movimiento.save!
      redirect_to [:edit, :admin, @movimiento], notice: t(action_name, scope: :notice)
    end

    def update
      @movimiento.update! movimiento_params
      path = url_for([:edit, :admin, @movimiento])
      link = view_context.link_to('Volver', url_for([:admin, @movimiento.class])) if can? :manage, @movimiento.class

      if params[:accion] == 'confirmar'
        @movimiento.confirmar
        path = url_for([:admin, @movimiento.class])
        link = nil
      end
      redirect_to path, notice: t(action_name, link: link, scope: :notice)
    end

    def confirmar
      if @movimiento.confirmar
        redirect_to [:admin, @movimiento.class], notice: t(action_name, scope: :notice)
      else
        redirect_to [:admin, @movimiento.class], alert: t(action_name, scope: :alert)
      end
    end

    def destroy
      if @movimiento.destroy
        redirect_to [:admin, @movimiento.class], notice: t(action_name, scope: :notice)
      else
        redirect_to [:admin, @movimiento.class], alert: t(action_name, scope: :alert)
      end
    end

    private

    def movimiento_params
      params.require(:movimiento).permit(:fecha, :remito, items_attributes: [:id, :cantidad, :producto_id, :_destroy])
    end

    def proteger
      redirect_to [:admin, @movimiento.class], alert: t(:no_puede_editar, scope: :alert) if @movimiento.esta_confirmado?
    end

  end
end
