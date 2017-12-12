class Tarea < ApplicationRecord

  # CONFIG

  include Destroyable

  UNIDADES = %w(metro metro_2 litro unidad kilo tonelada hora kilometro)

  # CALLBACKS

  # RELATIONS

  has_many :trabajos

  has_and_belongs_to_many :tipos_programa, class_name: 'TipoPrograma'

  # SCOPES

  # VALIDATIONS

  validates :nombre, :unidad, presence: true
  validates :unidad, inclusion: { in: UNIDADES }

  # CLASS METHODS

  # INSTANCE METHODS

  def can_delete?
    trabajos.empty?
  end

  # ALIASES

  def to_label
    "#{nombre} (#{unidad})"
  end

  alias_attribute :to_s, :nombre

  # PRIVATE METHODS

  private

end
