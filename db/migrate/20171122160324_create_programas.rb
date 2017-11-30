class CreateProgramas < ActiveRecord::Migration[5.1]
  def change
    create_table :programas do |t|
      t.date :desde, :hasta
      t.string :capataz, :inspector
      t.integer :dotacion_original, :dotacion_real
      t.text :observaciones
      
      t.datetime :deleted_at, index: true
      t.integer :trabajos_count, default: 0, null: false
      t.belongs_to :via, foreign_key: true, index: true
      t.belongs_to :cuadrilla, foreign_key: true, index: true
      t.timestamps
    end
  end
end
