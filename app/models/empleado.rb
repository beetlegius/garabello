class Empleado < ApplicationRecord

  # CONFIG

  include Destroyable

  # CALLBACKS

  # RELATIONS

  belongs_to :cuadrilla, counter_cache: true
  has_many :asistencias
  has_many :programas, through: :asistencias

  # SCOPES

  # VALIDATIONS

  validates :nombre, :apellido, presence: true

  # CLASS METHODS

  # INSTANCE METHODS

  def nombre_completo
    [nombre, apellido].join(" ")
  end

  def can_delete?
    asistencias.empty?
  end

  # ALIASES

  alias_method :to_s, :nombre_completo
  alias_method :to_label, :nombre_completo

  # PRIVATE METHODS

  private

end
