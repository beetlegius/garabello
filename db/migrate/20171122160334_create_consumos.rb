class CreateConsumos < ActiveRecord::Migration[5.1]
  def change
    create_table :consumos do |t|
      t.date :fecha
      t.integer :cantidad
      t.decimal :km_desde, :km_hasta

      t.datetime :deleted_at, index: true
      t.belongs_to :recurso, foreign_key: true, index: true
      t.belongs_to :programa, foreign_key: true, index: true
      t.timestamps
    end
  end
end
