module Admin
  class RelevamientosController < BaseController
    load_and_authorize_resource

    def show
      @estructura = @relevamiento.estructura
      @relevamiento = @relevamiento.decorate
    end
  end
end
