class Cuadrilla < ApplicationRecord

  # CONFIG

  include Destroyable

  enum sector: [NORTE = 'inspectoria_norte', SUR = 'inspectoria_sur']

  # CALLBACKS

  # RELATIONS

  belongs_to :tipo_programa, counter_cache: true

  has_many :empleados
  has_many :programas

  # SCOPES

  default_scope -> { order :nombre }

  # VALIDATIONS

  validates :nombre, :sector, presence: true

  # CLASS METHODS

  # INSTANCE METHODS

  def can_delete?
    programas.empty? && empleados.empty?
  end

  # ALIASES

  alias_attribute :to_s, :nombre
  alias_attribute :to_label, :nombre

  # PRIVATE METHODS

  private

end
