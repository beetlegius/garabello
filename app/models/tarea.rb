class Tarea < ApplicationRecord

  # CONFIG

  include Destroyable

  UNIDADES = %w(metro unidad metro_2 toneladas horas kilometro litros varios)

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

  alias_attribute :to_s, :nombre
  alias_attribute :to_label, :nombre

  # PRIVATE METHODS

  private

end
