class CreateNovedadesSolicitud < ActiveRecord::Migration[5.1]
  def change
    create_table :novedades_solicitud do |t|
      t.date :fecha
      t.text :contenido

      t.datetime :deleted_at, index: true
      t.belongs_to :solicitud, foreign_key: true, index: true
      t.belongs_to :user, foreign_key: true, index: true
      t.timestamps
    end
  end
end
