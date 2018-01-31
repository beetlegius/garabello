class Estructura < ApplicationRecord

  # CONFIG

  include Destroyable

  MATERIALES = %w(mamposteria metalico madera)

  enum tipo: TIPOS = %w(via_doble via_unica via)
  enum tipo_tablero: TIPOS_TABLERO = %w(abierto cerrado)
  enum material_tableros: MATERIALES, _suffix: true
  enum material_estribos: MATERIALES, _suffix: true
  enum material_pilares: MATERIALES, _suffix: true

  # CALLBACKS

  # RELATIONS

  belongs_to :ramal
  belongs_to :estacion_anterior, class_name: 'Estacion'
  belongs_to :estacion_siguiente, class_name: 'Estacion'

  has_many :pilares
  has_many :secciones
  has_many :relevamientos, -> { order fecha: :desc }

  # SCOPES

  # VALIDATIONS

  validates :km, :tipo, :cantidad_tableros, :tipo_tablero,
    :material_tableros, :material_estribos, :material_pilares, presence: true
  # validates :tipo, inclusion: { in: TIPOS }
  # validates :tipo_tableros, inclusion: { in: TIPOS_TABLERO }
  # validates :material_tableros, :material_estribos, :material_pilares, inclusion: { in: MATERIALES }
  validates :km, numericality: { greater_than: 0 }, uniqueness: true

  # CLASS METHODS

  # INSTANCE METHODS

  # ALIASES

  alias_attribute :to_label, :nombre
  alias_attribute :to_s, :nombre

  # PRIVATE METHODS

  private

end
