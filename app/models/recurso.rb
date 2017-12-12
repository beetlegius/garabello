class Recurso < ApplicationRecord

  # CONFIG

  include Destroyable

  UNIDADES = %w(metro metro_2 litro unidad kilo tonelada hora kilometro)

  # CALLBACKS

  # RELATIONS

  has_many :consumos
  has_many :programas, through: :consumos

  has_and_belongs_to_many :tipos_programa, class_name: 'TipoPrograma'

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
