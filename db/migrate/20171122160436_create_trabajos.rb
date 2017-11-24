class CreateTrabajos < ActiveRecord::Migration[5.1]
  def change
    create_table :trabajos do |t|
      t.date :fecha
      t.integer :cantidad_ejecutada
      t.integer :cantidad_estimada
      t.integer :km_desde, :km_hasta

      t.datetime :deleted_at, index: true
      t.string :type
      t.belongs_to :programa, foreign_key: true, index: true
      t.belongs_to :tarea, foreign_key: true, index: true
      t.timestamps
    end
  end
end
