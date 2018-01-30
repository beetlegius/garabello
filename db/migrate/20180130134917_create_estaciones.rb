class CreateEstaciones < ActiveRecord::Migration[5.1]
  def change
    create_table :estaciones do |t|
      t.string :nombre

      t.integer :posicion
      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
