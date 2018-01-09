class CreateTareas < ActiveRecord::Migration[5.1]
  def change
    create_table :tareas do |t|
      t.string :nombre
      t.string :unidad
      t.decimal :esfuerzo, precision: 12, scale: 8

      t.datetime :deleted_at, index: true
      t.integer :trabajos_count, default: 0, null: false
      t.timestamps
    end
  end
end
