class CreateAsistencias < ActiveRecord::Migration[5.1]
  def change
    create_table :asistencias do |t|
      t.date :fecha
      t.integer :estado
      t.integer :recargo_horas # t.decimal :recargo_horas, precision: 10, scale: 3

      t.datetime :deleted_at, index: true
      t.belongs_to :jornada, foreign_key: true, index: true
      t.belongs_to :empleado, foreign_key: true, index: true
      t.belongs_to :programa, foreign_key: true, index: true

      t.index [:jornada_id, :empleado_id], unique: true
      t.timestamps
    end
  end
end
