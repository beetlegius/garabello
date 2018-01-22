class CreateSolicitudes < ActiveRecord::Migration[5.1]
  def change
    create_table :solicitudes do |t|
      t.date :fecha
      t.string :lugar
      t.string :codigo_requerimiento
      t.integer :categoria
      t.integer :estado
      t.integer :urgencia

      t.integer :items_count, :novedades_count, default: 0, null: false
      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
