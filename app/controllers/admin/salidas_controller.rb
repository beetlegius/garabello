class SalidasController < ApplicationController
  load_and_authorize_resource
  before_action :proteger, only: %w(edit update)

  def index
    set_variables 'Salidas', 'Salida de productos'

    respond_to do |format|
      format.html
      format.json { render json: SalidasDatatable.new(view_context) }
    end
  end

  def show
    render layout: 'print'
  end

  def new
    render :form
  end

  def edit
    @salida.items.build if @salida.items.empty?
    render :form
  end

  def create
    @salida.usuario = current_user
    @salida.save!
    redirect_to edit_salida_path(@salida), notice: t(action_name, scope: :notice)
  end

  def update
    @salida.update! salida_params
    path = edit_salida_path(@salida)
    link = view_context.link_to('Volver', salidas_path) if can? :manage, Salida

    if params[:accion] == 'confirmar'
      @salida.confirmar
      path = salidas_path
      link = nil
    end
    redirect_to path, notice: t(action_name, link: link, scope: :notice)
  end

  def confirmar
    if @salida.confirmar
      redirect_to salidas_path, notice: t(action_name, scope: :notice)
    else
      redirect_to salidas_path, alert: t(action_name, scope: :alert)
    end
  end

  def destroy
    if @salida.destroy
      redirect_to salidas_path, notice: t(action_name, scope: :notice)
    else
      redirect_to salidas_path, alert: t(action_name, scope: :alert)
    end
  end

  private

  def salida_params
    params.require(:salida).permit(:comprador, items_attributes: [:id, :cantidad, :producto_codigo, :_destroy])
  end

  def proteger
    redirect_to salidas_path, alert: t(:no_puede_editar, scope: :alert) if @salida.esta_confirmado?
  end

end
