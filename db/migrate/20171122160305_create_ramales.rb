class CreateRamales < ActiveRecord::Migration[5.1]
  def change
    create_table :ramales do |t|
      t.string :nombre

      t.datetime :deleted_at, index: true
      t.integer :estaciones_count, default: 0, null: false
      t.integer :programas_count, default: 0, null: false
      t.timestamps
    end
  end
end
