class Asistencia < ApplicationRecord

  # CONFIG

  enum estado: [PRESENTE = 'presente', AUSENTE = 'ausente', AUSENTE_SIN_AVISO = 'ausente_sin_aviso']

  include Destroyable

  # CALLBACKS

  # RELATIONS

  belongs_to :programa
  belongs_to :jornada
  belongs_to :empleado, counter_cache: true

  # SCOPES

  scope :alfabetico, -> { joins(:empleado).order("empleados.apellido", "empleados.nombre") }

  # VALIDATIONS

  # validates :cantidad_presence, :cantidad_ausente, :cantidad_ausente_sin_aviso, :recargo_horas, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :jornada_id, presence: true, uniqueness: { scope: :empleado_id }
  validates :recargo_horas, numericality: { greater_than_or_equal_to: 0, allow_nil: true }

  # CLASS METHODS

  # INSTANCE METHODS

  def fecha
    jornada&.fecha
  end

  # ALIASES

  # PRIVATE METHODS

  private

end
