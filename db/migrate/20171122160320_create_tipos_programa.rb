class CreateTiposPrograma < ActiveRecord::Migration[5.1]
  def change
    create_table :tipos_programa do |t|
      t.string :nombre

      t.datetime :deleted_at, index: true
      t.integer :programas_count, default: 0, null: false
      t.timestamps
    end
  end
end
