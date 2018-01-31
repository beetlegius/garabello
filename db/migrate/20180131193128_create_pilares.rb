class CreatePilares < ActiveRecord::Migration[5.1]
  def change
    create_table :pilares do |t|
      t.integer :posicion

      t.datetime :deleted_at, index: true
      t.belongs_to :estructura, foreign_key: true, index: true
      t.timestamps
    end
  end
end
