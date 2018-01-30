class CreateFotos < ActiveRecord::Migration[5.1]
  def change
    create_table :fotos do |t|
      t.string :epigrafe
      t.string :imagen_uid, :imagen_name

      t.datetime :deleted_at, index: true
      t.belongs_to :relevamiento, foreign_key: true, index: true
      t.timestamps
    end
  end
end
