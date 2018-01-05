class Consumo < ApplicationRecord

  # CONFIG

  include Destroyable

  # CALLBACKS

  # RELATIONS

  belongs_to :recurso, counter_cache: true
  belongs_to :programa
  belongs_to :jornada

  # SCOPES

  # VALIDATIONS

  validates :cantidad, :km_desde, :km_hasta, presence: true
  validates :cantidad, numericality: { greater_than: 0 }

  # CLASS METHODS

  # INSTANCE METHODS

  def fecha
    jornada&.fecha
  end

  def asociar_jornada(jornada)
    self.jornada = jornada
    self.km_desde = jornada.km_desde
    self.km_hasta = jornada.km_hasta
  end

  # ALIASES

  alias_method :to_s, :fecha
  alias_method :to_label, :fecha

  # PRIVATE METHODS

  private

end
