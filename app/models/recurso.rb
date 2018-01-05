class Recurso < ApplicationRecord

  # CONFIG

  include Destroyable

  UNIDADES = %w(metro metro_2 metro_3 litro unidad kilo tonelada hora kilometro)

  # CALLBACKS

  # RELATIONS

  has_many :consumos
  has_many :programas, through: :consumos

  has_and_belongs_to_many :tipos_programa, class_name: 'TipoPrograma'

  # SCOPES

  default_scope -> { order :nombre }

  # VALIDATIONS

  validates :nombre, :unidad, presence: true
  validates :unidad, inclusion: { in: UNIDADES }

  # CLASS METHODS

  # INSTANCE METHODS

  def can_delete?
    consumos.empty?
  end

  # ALIASES

  def to_label
    "#{nombre} (#{unidad.humanize.downcase})"
  end

  alias_attribute :to_s, :nombre

  # PRIVATE METHODS

  private

end
