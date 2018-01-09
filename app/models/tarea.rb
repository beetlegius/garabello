class Tarea < ApplicationRecord

  # CONFIG

  include Destroyable

  UNIDADES = %w(metro metro_2 litro unidad kilo tonelada hora kilometro)
  ESFUERZO = 0.125

  # CALLBACKS

  after_initialize :set_esfuerzo

  # RELATIONS

  has_many :trabajos

  has_and_belongs_to_many :tipos_programa, class_name: 'TipoPrograma'

  # SCOPES

  default_scope -> { order :nombre }

  # VALIDATIONS

  validates :nombre, :unidad, :esfuerzo, presence: true
  validates :unidad, inclusion: { in: UNIDADES }
  validates :esfuerzo, numericality: { greater_than: 0 }

  # CLASS METHODS

  # INSTANCE METHODS

  def can_delete?
    trabajos.empty?
  end

  # ALIASES

  def to_label
    "#{nombre} (#{unidad.humanize.downcase})"
  end

  alias_attribute :to_s, :nombre

  # PRIVATE METHODS

  private

  def set_esfuerzo
    self.esfuerzo ||= rand(ESFUERZO..1.0)
  end

end
