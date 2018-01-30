module Admin
  class SolicitudesController < BaseController
    load_and_authorize_resource

    def index
      @autocomplete_url = autocomplete_admin_productos_url(solicitado: true)
      @q = Solicitud.search params[:q]
      @autocomp
      respond_to do |format|
        format.html
        format.js
        format.csv { send_data @q.result(distinct: true).to_csv, filename: "solicitudes.csv" }
        format.json { render json: SolicitudesDatatable.new(view_context) }
      end
    end

    def items
    end

    def show
      @solicitud = @solicitud.decorate
    end

    def new
      render :form
    end

    def edit
      @autocomplete_url = autocomplete_admin_productos_url
      render :form
    end

    def create
      @solicitud.save!
      redirect_to edit_admin_solicitud_path(@solicitud), notice: t(action_name, scope: :notice)
    end

    def update
      @autocomplete_url = autocomplete_admin_productos_url
      @solicitud.update! solicitud_params
      redirect_to [:edit, :admin, @solicitud], notice: t(action_name, link: view_context.link_to('Volver', admin_solicitudes_path), scope: :notice)
    end

    def destroy
      if @solicitud.destroy
        redirect_to admin_solicitudes_path, notice: t(action_name, scope: :notice)
      else
        redirect_to admin_solicitudes_path, alert: t(action_name, scope: :alert)
      end
    end

    def enviar
      SolicitudMailer.enviar(@solicitud).deliver
      redirect_to admin_solicitud_path(@solicitud), notice: t(action_name, scope: :notice)
    end

    private

    def solicitud_params
      params.require(:solicitud).permit(:fecha, :lugar, :codigo_requerimiento, :categoria, :estado, :urgencia, items_attributes: [:id, :cantidad, :producto_id, :_destroy], novedades_attributes: [:id, :fecha, :contenido, :user_id, :_destroy])
    end

  end
end
