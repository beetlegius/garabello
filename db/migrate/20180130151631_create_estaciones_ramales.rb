class CreateEstacionesRamales < ActiveRecord::Migration[5.1]
  def change
    create_join_table :estaciones, :ramales do |t|
      t.index [:estacion_id, :ramal_id], unique: true
    end
  end
end
