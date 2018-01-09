class CreateTareasTiposPrograma < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tareas, :tipos_programa do |t|
      t.index [:tarea_id, :tipo_programa_id], unique: true, name: :index_tarea_tipos_programa
    end
  end
end
