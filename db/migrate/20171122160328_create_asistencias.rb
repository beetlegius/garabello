class CreateAsistencias < ActiveRecord::Migration[5.1]
  def change
    create_table :asistencias do |t|
      t.date :fecha
      t.integer :estado
      # t.integer :cantidad_presente
      # t.integer :cantidad_ausente
      # t.integer :cantidad_ausente_sin_aviso
      t.decimal :recargo_horas, precision: 10, scale: 3

      t.datetime :deleted_at, index: true
      t.belongs_to :programa, foreign_key: true, index: true
      t.belongs_to :empleado, foreign_key: true, index: true

      t.index [:fecha, :empleado_id, :programa_id], unique: true
      t.timestamps
    end
  end
end
