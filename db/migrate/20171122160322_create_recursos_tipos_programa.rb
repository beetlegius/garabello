class CreateRecursosTiposPrograma < ActiveRecord::Migration[5.1]
  def change
    create_join_table :recursos, :tipos_programa do |t|
      t.index [:recurso_id, :tipo_programa_id], unique: true, name: :index_recursos_tipos_programa
    end
  end
end
