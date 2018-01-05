class Jornada < ApplicationRecord

  # CONFIG

  # CALLBACKS

  before_create :crear_asistencias

  # RELATIONS

  belongs_to :programa, counter_cache: true
  has_many :trabajos
  has_many :consumos
  has_many :asistencias

  # SCOPES

  default_scope -> { order :fecha }

  # VALIDATIONS

  validates :fecha, presence: true

  # CLASS METHODS

  # INSTANCE METHODS

  # ALIASES

  # PRIVATE METHODS

  private

    def crear_asistencias
      for empleado in programa.cuadrilla.empleados
        self.asistencias.build empleado: empleado, programa: programa, estado: Asistencia::SIN_ASIGNAR
      end
    end

end
