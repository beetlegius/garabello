class CreateJornadas < ActiveRecord::Migration[5.1]
  def change
    create_table :jornadas do |t|
      t.date :fecha
      t.decimal :km_desde, :km_hasta, precision: 10, scale: 3

      t.belongs_to :programa, foreign_key: true, index: true
      t.timestamps
    end
  end
end
