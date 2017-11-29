class Tarea < ApplicationRecord

  # CONFIG

  include Destroyable

  UNIDADES = %w(metro unidad metro_2 toneladas horas kilometro litros)

  # CALLBACKS

  # RELATIONS

  has_many :trabajos

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
