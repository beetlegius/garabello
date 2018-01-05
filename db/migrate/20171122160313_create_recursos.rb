class CreateRecursos < ActiveRecord::Migration[5.1]
  def change
    create_table :recursos do |t|
      t.string :nombre
      t.string :unidad

      t.datetime :deleted_at, index: true
      t.integer :consumos_count, default: 0, null: false
      t.timestamps
    end
  end
end
