class Cuadrilla < ApplicationRecord

  # CONFIG

  include Destroyable

  # CALLBACKS

  # RELATIONS

  has_many :empleados
  has_many :programas

  # SCOPES

  # VALIDATIONS

  validates :nombre, presence: true

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
