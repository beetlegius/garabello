class CreateItemsMovimiento < ActiveRecord::Migration[5.1]
  def change
    create_table :items_movimiento do |t|
      t.decimal :cantidad, precision: 15, scale: 2, default: 1

      t.datetime :deleted_at, index: true
      t.belongs_to :movimiento, foreign_key: true, index: true
      t.belongs_to :producto, foreign_key: true, index: true
      t.timestamps
    end
  end
end
