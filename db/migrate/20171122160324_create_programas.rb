class CreateProgramas < ActiveRecord::Migration[5.1]
  def change
    create_table :programas do |t|
      t.date :desde, :hasta
      t.string :capataz, :inspector
      t.text :observaciones

      t.datetime :deleted_at, index: true
      t.integer :jornadas_count, default: 0, null: false
      t.integer :trabajos_count, default: 0, null: false
      t.belongs_to :user, foreign_key: true, index: true
      t.belongs_to :via, foreign_key: true, index: true
      t.belongs_to :cuadrilla, foreign_key: true, index: true
      t.belongs_to :tipo_programa, foreign_key: true, index: true
      t.timestamps
    end
  end
end
