class Trabajo < ApplicationRecord

  # CONFIG

  include Destroyable

  # CALLBACKS

  # RELATIONS

  belongs_to :programa, counter_cache: true
  belongs_to :jornada
  belongs_to :tarea, counter_cache: true

  # SCOPES

  scope :de_tarea, ->(una_tarea) { where tarea_id: una_tarea }
  scope :entre, ->(desde, hasta) { joins(:jornada).where("jornadas.fecha >= :desde AND jornadas.fecha <= :hasta", desde: desde, hasta: hasta).order("jornadas.fecha") }

  # VALIDATIONS

  validates :cantidad_ejecutada, :km_desde, :km_hasta, presence: true
  validates :km_desde, :km_hasta, numericality: { greater_than_or_equal_to: 0 }
  validates :cantidad_ejecutada, :cantidad_estimada, numericality: { greater_than_or_equal_to: 0, allow_nil: true }

  # CLASS METHODS

  # INSTANCE METHODS

  def fecha
    jornada&.fecha
  end

  def cantidad_correcta?
    cantidad_estimada == cantidad_ejecutada
  end

  def dentro_de_programa_anual?
    jornada.fecha.day < 8 || jornada.fecha.day > 22
  end

  def porcentaje_completado
    cantidad_ejecutada < cantidad_estimada.to_i ? cantidad_ejecutada * 100 / cantidad_estimada : 100
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
