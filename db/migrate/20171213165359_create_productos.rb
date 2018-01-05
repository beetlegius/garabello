class CreateProductos < ActiveRecord::Migration[5.1]
  def change
    create_table :productos do |t|
      t.string :codigo
      t.string :nombre
      t.string :unidad

      t.index :codigo, unique: true
      t.datetime :deleted_at, index: true
      t.decimal :cantidad, precision: 15, scale: 2, default: 0
      t.belongs_to :cip, foreign_key: true, index: true
      t.timestamps
    end
  end
end
