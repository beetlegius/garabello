class CreateAsistencias < ActiveRecord::Migration[5.1]
  def change
    create_table :asistencias do |t|
      t.integer :cantidad_presente
      t.integer :cantidad_ausente
      t.integer :cantidad_ausente_sin_aviso
      t.integer :recargo_horas

      t.datetime :deleted_at, index: true
      t.belongs_to :programa, foreign_key: true, index: true
      t.belongs_to :empleado, foreign_key: true, index: true
      t.timestamps
    end
  end
end
