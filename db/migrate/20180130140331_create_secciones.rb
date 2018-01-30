class CreateSecciones < ActiveRecord::Migration[5.1]
  def change
    create_table :secciones do |t|
      t.decimal :metros, precision: 15, scale: 2
      t.decimal :luz, precision: 15, scale: 2
      t.decimal :diametro, precision: 15, scale: 2

      t.integer :posicion
      t.string :type
      t.datetime :deleted_at, index: true
      t.belongs_to :estructura, foreign_key: true, index: true
      t.timestamps
    end
  end
end
