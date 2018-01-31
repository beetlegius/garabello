class CreateEstadosSeccion < ActiveRecord::Migration[5.1]
  def change
    create_table :estados_seccion do |t|
      t.integer :estado
      t.string :observaciones

      t.belongs_to :seccion, foreign_key: true, index: true
      t.belongs_to :relevamiento, foreign_key: true, index: true
      t.timestamps
    end
  end
end
