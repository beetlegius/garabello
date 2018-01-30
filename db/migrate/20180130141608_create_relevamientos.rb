class CreateRelevamientos < ActiveRecord::Migration[5.1]
  def change
    create_table :relevamientos do |t|
      t.date :fecha

      ##################### SUPERESTRUCTURA #####################

      # VÍAS
      t.integer :estado_bulones_de_amarre
      t.integer :estado_contra_rieles
      t.integer :estado_tacos_de_madera
      t.integer :estado_nivelacion_de_cabeceras
      # DURMIENTES
      t.integer :estado_durmientes
      t.string :observaciones_durmientes
      # PINTURA
      t.integer :estado_pintura
      t.string :observaciones_pintura

      ##################### INFRAESTRUCTURA #####################

      # ESTRIBOS
      t.integer :estado_mamposteria_muro_lateral_ascendente
      t.integer :estado_mamposteria_muro_lateral_descendente
      t.integer :estado_mamposteria_muro_frontal_ascendente
      t.integer :estado_mamposteria_muro_frontal_descendente
      t.integer :estado_mamposteria_zapatas_ascendente
      t.integer :estado_mamposteria_zapatas_descendente
      t.integer :estado_vegetacion_muro_lateral_ascendente
      t.integer :estado_vegetacion_muro_lateral_descendente
      t.integer :estado_vegetacion_muro_frontal_ascendente
      t.integer :estado_vegetacion_muro_frontal_descendente
      t.integer :estado_vegetacion_zapatas_ascendente
      t.integer :estado_vegetacion_zapatas_descdendente
      t.text :observaciones_pilares_estribos

      # DEFENSAS
      t.text :observaciones_pilares_defensas
      t.integer :estado_taludes_margen_izquierda_aguas_arriba
      t.integer :estado_taludes_margen_derecha_aguas_arriba
      t.integer :estado_taludes_margen_izquierda_aguas_abajo
      t.integer :estado_taludes_margen_derecha_aguas_abajo
      t.integer :estado_defensas_estribos_ascendente
      t.integer :estado_defensas_estribos_descendente
      t.integer :estado_cauce
      t.string :observaciones_cauce
      t.text :observaciones_generales

      t.datetime :deleted_at, index: true
      t.integer :fotos_count, default: 0, null: false
      t.belongs_to :estructura, foreign_key: true, index: true
      t.timestamps
    end
  end
end
