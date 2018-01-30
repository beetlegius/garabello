class Relevamiento < ApplicationRecord

  # CONFIG

  include Destroyable

  ESTADOS = %w(bueno regular malo)

  # SUPERESTRUCTURA
  enum estado_bulones_de_amarre: ESTADOS, _suffix: true
  enum estado_contra_rieles: ESTADOS, _suffix: true
  enum estado_tacos_de_madera: ESTADOS, _suffix: true
  enum estado_nivelacion_de_cabeceras: ESTADOS, _suffix: true
  enum estado_durmientes: ESTADOS, _suffix: true
  enum estado_pintura: ESTADOS, _suffix: true

  # INFRAESTRUCTURA
  # ESTRIBOS
  enum estado_mamposteria_muro_lateral_ascendente: ESTADOS, _suffix: true
  enum estado_mamposteria_muro_lateral_descendente: ESTADOS, _suffix: true
  enum estado_mamposteria_muro_frontal_ascendente: ESTADOS, _suffix: true
  enum estado_mamposteria_muro_frontal_descendente: ESTADOS, _suffix: true
  enum estado_mamposteria_zapatas_ascendente: ESTADOS, _suffix: true
  enum estado_mamposteria_zapatas_descendente: ESTADOS, _suffix: true
  enum estado_vegetacion_muro_lateral_ascendente: ESTADOS, _suffix: true
  enum estado_vegetacion_muro_lateral_descendente: ESTADOS, _suffix: true
  enum estado_vegetacion_muro_frontal_ascendente: ESTADOS, _suffix: true
  enum estado_vegetacion_muro_frontal_descendente: ESTADOS, _suffix: true
  enum estado_vegetacion_zapatas_ascendente: ESTADOS, _suffix: true
  enum estado_vegetacion_zapatas_descdendente: ESTADOS, _suffix: true
  # DEFENSAS
  enum estado_taludes_margen_izquierda_aguas_arriba: ESTADOS, _suffix: true
  enum estado_taludes_margen_derecha_aguas_arriba: ESTADOS, _suffix: true
  enum estado_taludes_margen_izquierda_aguas_abajo: ESTADOS, _suffix: true
  enum estado_taludes_margen_derecha_aguas_abajo: ESTADOS, _suffix: true
  enum estado_defensas_estribos_ascendente: ESTADOS, _suffix: true
  enum estado_defensas_estribos_descendente: ESTADOS, _suffix: true
  enum estado_cauce: ESTADOS, _suffix: true

  # CALLBACKS

  # RELATIONS

  belongs_to :estructura, counter_cache: true
  has_many :fotos, dependent: :destroy
  has_many :estados_seccion
  has_many :secciones, through: :estados_seccion

  # SCOPES

  # VALIDATIONS

  validates :fecha, presence: true

  # CLASS METHODS

  # INSTANCE METHODS

  # ALIASES

  # PRIVATE METHODS

  private

end
