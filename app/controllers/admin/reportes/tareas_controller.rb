module Admin
  module Reportes
    class TareasController < BaseController

      def index
        authorize! :reportes, :tareas
        params[:desde] ||= 1
        params[:hasta] ||= 12
        if params[:hasta].to_i < params[:desde].to_i
          params[:hasta] = params[:desde]
          flash.now.alert = t(:fecha_invalida, scope: :alert)
        end

        minimo = Jornada.minimum(:fecha) || Date.today
        @years  = (minimo.year..Date.today.year).reverse_each
        @months = (1..12).map { |mes| [view_context.date(Date.new(2017, mes), format: '%B').humanize, mes] }
        @tareas = Tarea.all
        @tarea = Tarea.find params[:tarea_id] if params[:tarea_id]

        desde = Date.new(params[:ano].to_i, params[:desde].to_i).beginning_of_month
        hasta = Date.new(params[:ano].to_i, params[:hasta].to_i).end_of_month

        @series = [
          {
            name: "Plan anual abstracto",
            data: Trabajo.where("jornadas.fecha >= :desde AND jornadas.fecha <= :hasta", desde: desde, hasta: hasta).where(tarea_id: params[:tarea_id]).joins(:jornada).group_by_month("jornadas.fecha").sum('trabajos.cantidad_estimada').map { |res| [view_context.date(res[0], format: '%B'), res[1]] },
            stack: 'abstracto'
          },
          {
            name: "#{TrabajoPAT.model_name.human}: estimado",
            data: TrabajoPAT.where("jornadas.fecha >= :desde AND jornadas.fecha <= :hasta", desde: desde, hasta: hasta).where(tarea_id: params[:tarea_id]).joins(:jornada).group_by_month("jornadas.fecha").sum('trabajos.cantidad_estimada').map { |res| [view_context.date(res[0], format: '%B'), res[1]] },
            stack: 'estimado'
          },
          {
            name: "#{TrabajoPAM.model_name.human}: estimado",
            data: TrabajoPAM.where("jornadas.fecha >= :desde AND jornadas.fecha <= :hasta", desde: desde, hasta: hasta).where(tarea_id: params[:tarea_id]).joins(:jornada).group_by_month("jornadas.fecha").sum('trabajos.cantidad_estimada').map { |res| [view_context.date(res[0], format: '%B'), res[1]] },
            stack: 'estimado'
          },
          {
            name: "#{TrabajoFP.model_name.human}: ejecutado",
            data: TrabajoFP.where("jornadas.fecha >= :desde AND jornadas.fecha <= :hasta", desde: desde, hasta: hasta).where(tarea_id: params[:tarea_id]).joins(:jornada).group_by_month("jornadas.fecha").sum('trabajos.cantidad_ejecutada').map { |res| [view_context.date(res[0], format: '%B'), res[1]] },
            stack: 'ejecutado'
          },
          {
            name: "#{TrabajoPAT.model_name.human}: ejecutado",
            data: TrabajoPAT.where("jornadas.fecha >= :desde AND jornadas.fecha <= :hasta", desde: desde, hasta: hasta).where(tarea_id: params[:tarea_id]).joins(:jornada).group_by_month("jornadas.fecha").sum('trabajos.cantidad_ejecutada').map { |res| [view_context.date(res[0], format: '%B'), res[1]] },
            stack: 'ejecutado'
          },
          {
            name: "#{TrabajoPAM.model_name.human}: ejecutado",
            data: TrabajoPAM.where("jornadas.fecha >= :desde AND jornadas.fecha <= :hasta", desde: desde, hasta: hasta).where(tarea_id: params[:tarea_id]).joins(:jornada).group_by_month("jornadas.fecha").sum('trabajos.cantidad_ejecutada').map { |res| [view_context.date(res[0], format: '%B'), res[1]] },
            stack: 'ejecutado'
          }
        ]
      end

    end
  end
end
