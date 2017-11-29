class Recurso < ApplicationRecord

  # CONFIG

  include Destroyable

  UNIDADES = %w(metro unidad metro_2 toneladas horas kilometro litros)

  # CALLBACKS

  # RELATIONS

  has_many :consumos
  has_many :programas, through: :consumos

  # SCOPES

  # VALIDATIONS

  validates :nombre, :unidad, presence: true
  validates :unidad, inclusion: { in: UNIDADES }

  # CLASS METHODS

  # INSTANCE METHODS

  def can_delete?
    consumos.empty?
  end

  # ALIASES

  alias_attribute :to_s, :nombre
  alias_attribute :to_label, :nombre

  # PRIVATE METHODS

  private

end
