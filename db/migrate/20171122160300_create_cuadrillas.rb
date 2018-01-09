class CreateCuadrillas < ActiveRecord::Migration[5.1]
  def change
    create_table :cuadrillas do |t|
      t.string :nombre
      t.integer :sector

      t.datetime :deleted_at, index: true
      t.integer :empleados_count, default: 0, null: false
      t.integer :programas_count, default: 0, null: false
      t.belongs_to :tipo_programa, index: true, foreign_key: true
      t.timestamps
    end
  end
end
