class CreateEmpleados < ActiveRecord::Migration[5.1]
  def change
    create_table :empleados do |t|
      t.string :nombre
      t.string :apellido

      t.datetime :deleted_at, index: true
      t.integer :asistencias_count, default: 0, null: false
      t.belongs_to :cuadrilla, foreign_key: true, index: true
      t.timestamps
    end
  end
end
