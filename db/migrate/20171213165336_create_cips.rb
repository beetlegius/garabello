class CreateCips < ActiveRecord::Migration[5.1]
  def change
    create_table :cips do |t|
      t.string :codigo
      t.string :nombre

      t.index :codigo, unique: true
      t.datetime :deleted_at, index: true
      t.integer :productos_count, default: 0, null: false
      t.timestamps
    end
  end
end
