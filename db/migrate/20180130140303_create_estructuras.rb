class CreateEstructuras < ActiveRecord::Migration[5.1]
  def change
    create_table :estructuras do |t|
      t.decimal :km, precision: 10, scale: 3
      t.integer :tipo
      t.string :partido, :localidad
      t.integer :cantidad_tableros, default: 1
      t.integer :tipo_tablero
      t.integer :material_tableros
      t.integer :material_estribos
      t.integer :material_pilares

      t.string :type
      t.datetime :deleted_at, index: true
      t.integer :secciones_count, :pilares_count, :relevamientos_count, default: 0, null: false
      t.belongs_to :estacion_anterior, :estacion_siguiente
      t.belongs_to :ramal, foreign_key: true, index: true
      t.timestamps
    end
  end
end
