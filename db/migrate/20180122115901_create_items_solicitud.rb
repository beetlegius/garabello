class CreateItemsSolicitud < ActiveRecord::Migration[5.1]
  def change
    create_table :items_solicitud do |t|
      t.decimal :cantidad, precision: 15, scale: 2

      t.datetime :deleted_at, index: true
      t.belongs_to :producto, foreign_key: true, index: true
      t.belongs_to :solicitud, foreign_key: true, index: true
      t.timestamps
    end
  end
end
