class Programa < ApplicationRecord

  # CONFIG

  attr_accessor :periodo

  include Destroyable

  UNIDADES = %w(metro unidad metro_2 toneladas horas kilometro litros)

  # CALLBACKS

  after_initialize :set_periodo
  before_create :crear_jornadas

  # RELATIONS

  belongs_to :user
  belongs_to :tipo_programa, counter_cache: true
  belongs_to :via, counter_cache: true
  belongs_to :cuadrilla, counter_cache: true

  has_many :asistencias, inverse_of: :programa, dependent: :destroy
  accepts_nested_attributes_for :asistencias, reject_if: :all_blank, allow_destroy: true
  has_many :empleados, -> { distinct }, through: :asistencias

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

  has_many :jornadas
  accepts_nested_attributes_for :jornadas, reject_if: :all_blank

  # has_many :trabajos, through: :jornadas
  # has_many :consumos, through: :jornadas
  # has_many :asistencias, through: :jornadas

  # SCOPES

  # VALIDATIONS

  validates :desde, :hasta, presence: true

  # CLASS METHODS

  class << self

    def to_csv
      attributes = %w{id tipo desde hasta cuadrilla via capataz inspector dotacion_original dotacion_real}

      CSV.generate(headers: true) do |csv|
        csv << attributes.map(&:humanize).map(&:upcase)

        all.each do |programa|
          csv << [
            programa.id,
            programa.tipo_programa.nombre,
            programa.desde,
            programa.hasta,
            programa.cuadrilla.nombre,
            programa.via.nombre,
            programa.capataz,
            programa.inspector,
            programa.dotacion_original,
            programa.dotacion_real
          ]
        end
      end
    end

  end

  # INSTANCE METHODS

  def dotacion
    asistencias.asignada.includes(:empleado).map(&:empleado).uniq
  end

  def dotacion_original
    empleados.count
  end

  def dotacion_real
    dotacion.count
  end

  def dotacion_correcta?
    dotacion_original == dotacion_real
  end

  def periodo
    "#{desde.strftime('%d-%m-%Y')} - #{hasta.strftime('%d-%m-%Y')}"
  end

  def periodo=(str)
    arr = str.split(" - ")
    self.desde = arr.first
    self.hasta = arr.last
  end

  # ALIASES

  # PRIVATE METHODS

  private

  def crear_jornadas
    (desde..hasta).each do |dia|
      self.jornadas.build fecha: dia
    end
  end

  def set_periodo
    self.desde ||= 1.week.ago.beginning_of_week
    self.hasta ||= 1.week.ago.beginning_of_week + 4.days
  end

end
