class CreateTrabajos < ActiveRecord::Migration[5.1]
  def change
    create_table :trabajos do |t|
      t.date :fecha
      t.integer :cantidad_ejecutada
      t.integer :cantidad_estimada
      t.decimal :km_desde, :km_hasta, precision: 10, scale: 3

      t.datetime :deleted_at, index: true
      t.string :type
      t.belongs_to :programa, foreign_key: true, index: true
      t.belongs_to :tarea, foreign_key: true, index: true
      t.index [:fecha, :tarea_id]
      t.timestamps
    end
  end
end
