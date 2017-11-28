class Programa < ApplicationRecord

  # CONFIG

  attr_accessor :rango

  include Destroyable

  UNIDADES = %w(metro unidad metro_2 toneladas horas kilometro litros)

  # CALLBACKS

  after_initialize :set_rango
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

  has_many :trabajos_pam, class_name: 'TrabajoPAM'
  accepts_nested_attributes_for :trabajos_pam, reject_if: :all_blank, allow_destroy: true
  has_many :trabajos_pat, class_name: 'TrabajoPAT'
  accepts_nested_attributes_for :trabajos_pat, reject_if: :all_blank, allow_destroy: true
  has_many :trabajos_fp, class_name: 'TrabajoFP'
  accepts_nested_attributes_for :trabajos_fp, reject_if: :all_blank, allow_destroy: true

  # SCOPES

  # VALIDATIONS

  validates :desde, :hasta, presence: true

  # CLASS METHODS

  # INSTANCE METHODS

  def rango
    # return nil if new_record?
    "#{desde.strftime('%d-%m-%Y')} - #{hasta.strftime('%d-%m-%Y')}"
  end

  def rango=(str)
    arr = str.split(" - ")
    self.desde = arr.first
    self.hasta = arr.last
  end

  # ALIASES

  # PRIVATE METHODS

  private

  def crear_asistencias
    for empleado in cuadrilla.empleados
      (desde..hasta).each do |dia|
        self.asistencias.build empleado: empleado, fecha: dia
      end
    end
  end

  def set_rango
    self.desde ||= 1.week.ago
    self.hasta ||= 1.day.ago
  end

end
