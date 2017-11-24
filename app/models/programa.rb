class Programa < ApplicationRecord

  # CONFIG

  include Destroyable
  
  UNIDADES = %w(metro unidad metro_2 toneladas horas kilometro litros)

  # CALLBACKS

  before_create :crear_asistencias

  # RELATIONS

  belongs_to :via, counter_cache: true
  belongs_to :cuadrilla, counter_cache: true

  has_many :asistencias, inverse_of: :programa, dependent: :destroy
  accepts_nested_attributes_for :asistencias, reject_if: :all_blank, allow_destroy: true
  has_many :empleados, through: :asistencias

  has_many :consumos, inverse_of: :programa, dependent: :destroy
  accepts_nested_attributes_for :consumos, reject_if: :all_blank, allow_destroy: true
  has_many :recursos, through: :consumos

  has_many :trabajos, inverse_of: :programa, dependent: :destroy
  accepts_nested_attributes_for :trabajos, reject_if: :all_blank, allow_destroy: true
  has_many :tareas, through: :trabajos

  # SCOPES

  # VALIDATIONS

  validates :desde, :hasta, presence: true

  # CLASS METHODS

  # INSTANCE METHODS

  # ALIASES

  # PRIVATE METHODS

  private

  def crear_asistencias
    for empleado in cuadrilla.empleados
      self.asistencias.build empleado: empleado
    end
  end

end
