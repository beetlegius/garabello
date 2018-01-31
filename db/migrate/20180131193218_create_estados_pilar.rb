class CreateEstadosPilar < ActiveRecord::Migration[5.1]
  def change
    create_table :estados_pilar do |t|
      t.integer :estado
      t.string :observaciones
      t.belongs_to :pilar, foreign_key: true
      t.belongs_to :relevamiento, foreign_key: true

      t.timestamps
    end
  end
end
