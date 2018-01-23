module Autocomplete
  class Productos < ApplicationAutocomplete

    private

    def id(producto)
      producto.id
    end

    def text(producto)
      producto.codigo
    end

    def element(producto)
      ApplicationController.new.render_to_string(partial: 'admin/productos/autocomplete', locals: { producto: producto }).html_safe
    end

    def results
      # result = Producto.where('codigo ILIKE :query OR nombre ILIKE :query', query: "%#{@view.params[:term]}%").limit(10)
      result = Producto.search(codigo_or_nombre_cont: @view.params[:term]).result(distinct: true).limit(50)
      result = result.disponible if @view.params[:disponible] == 'true'
      result = result.solicitado if @view.params[:solicitado] == 'true'
      @results ||= result
    end

    def count
      results.count
    end

  end
end
