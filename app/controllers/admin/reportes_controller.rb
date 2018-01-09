module Admin
  class ReportesController < BaseController
    authorize_resource class: false
    before_action :configurar

    def configurar
      params[:desde] ||= 1
      params[:hasta] ||= 12
      if params[:hasta].to_i < params[:desde].to_i
        params[:hasta] = params[:desde]
        flash.now.alert = t(:fecha_invalida, scope: :alert)
      end

      minimo = Jornada.minimum(:fecha) || Date.today
      maximo = Jornada.maximum(:fecha) || Date.today
      @years  = (minimo.year..maximo.year).reverse_each

      @desde = Date.new(params[:ano].to_i, params[:desde].to_i).beginning_of_month
      @hasta = Date.new(params[:ano].to_i, params[:hasta].to_i).end_of_month
    end

    def indicadores
      @trabajos = Trabajo.all
    end

    def recursos
      @recursos = Recurso.all
      @recurso  = @recursos.find params[:recurso_id] if params[:recurso_id]
      @consumos = Consumo.de_recurso(params[:recurso_id])
      @series_mensuales = @consumos.joins(:jornada).group_by_month("jornadas.fecha", range: (@desde..@hasta), format: '%B').sum('consumos.cantidad')
      @series_semanales = @consumos.joins(:jornada).group_by_week("jornadas.fecha", range: (@desde..@hasta), format: 'SEM %d/%m').sum('consumos.cantidad')
    end

    def tareas
      @tareas = Tarea.all
      @tarea  = @tareas.find params[:tarea_id] if params[:tarea_id]
      @trabajos = Trabajo.de_tarea(params[:tarea_id])

      @series = [
        {
          name: "#{TrabajoPAT.model_name.human}: estimado",
          data: TrabajoPAT.de_tarea(params[:tarea_id]).joins(:jornada).group_by_month("jornadas.fecha", range: @desde..@hasta, format: '%B').sum('trabajos.cantidad_estimada'),
          stack: 'estimado',
          color: ['#fff000']
        },
        {
          name: "#{TrabajoPAM.model_name.human}: estimado",
          data: TrabajoPAM.de_tarea(params[:tarea_id]).joins(:jornada).group_by_month("jornadas.fecha", range: @desde..@hasta, format: '%B').sum(:cantidad_estimada),
          stack: 'estimado'
        },
        {
          name: "#{TrabajoFP.model_name.human}: ejecutado",
          data: TrabajoFP.de_tarea(params[:tarea_id]).joins(:jornada).group_by_month("jornadas.fecha", range: @desde..@hasta, format: '%B').sum(:cantidad_ejecutada),
          stack: 'ejecutado'
        },
        {
          name: "#{TrabajoPAT.model_name.human}: ejecutado",
          data: TrabajoPAT.de_tarea(params[:tarea_id]).joins(:jornada).group_by_month("jornadas.fecha", range: @desde..@hasta, format: '%B').sum(:cantidad_ejecutada),
          stack: 'ejecutado'
        },
        {
          name: "#{TrabajoPAM.model_name.human}: ejecutado",
          data: TrabajoPAM.de_tarea(params[:tarea_id]).joins(:jornada).group_by_month("jornadas.fecha", range: @desde..@hasta, format: '%B').sum(:cantidad_ejecutada),
          stack: 'ejecutado'
        }
      ]

      @series_line = [
        {
          name: "Estimado",
          data: Trabajo.de_tarea(params[:tarea_id]).joins(:jornada).group_by_week("jornadas.fecha", range: @desde..@hasta, format: 'SEM %d/%m').sum(:cantidad_estimada)
        },
        {
          name: "Ejecutado",
          data: Trabajo.de_tarea(params[:tarea_id]).joins(:jornada).group_by_week("jornadas.fecha", range: @desde..@hasta, format: 'SEM %d/%m').sum(:cantidad_ejecutada)
        }
      ]
    end

  end
end
