class CreateMovimientos < ActiveRecord::Migration[5.1]
  def change
    create_table :movimientos do |t|
      t.date :fecha
      t.string :remito
      t.boolean :esta_confirmado, default: false

      t.string :type
      t.integer :items_count, default: 0, null: false
      t.datetime :deleted_at, index: true
      t.belongs_to :user, foreign_key: true, index: true
      t.timestamps
    end
  end
end
