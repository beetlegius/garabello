class TareasDatatable < ApplicationDatatable

  private

  def data
    tareas.map do |tarea|
      [].tap do |column|
        column << tarea.id
        column << tarea.nombre
        column << tarea.unidad

        links = []
        links.push @view.link_to('Editar', @view.edit_admin_tarea_path(tarea), class: 'btn btn-xs btn-info')
        links.push @view.link_to('Eliminar', @view.admin_tarea_path(tarea), method: :delete, class: 'btn btn-xs btn-danger', data: { confirm: @view.t(:confirm) })
        column << @view.tag.div(links.join.html_safe, class: 'btn-group pull-right')
      end
    end
  end

  def count
    tareas.count
  end

  def total_entries
    tareas.count
  end

  def tareas
    @tareas ||= Tarea.all
  end

end
