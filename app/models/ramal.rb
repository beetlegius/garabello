class Ramal < ApplicationRecord

  # CONFIG

  include Destroyable

  # CALLBACKS

  # RELATIONS

  has_many :programas
  has_and_belongs_to_many :estaciones

  # SCOPES

  # VALIDATIONS

  validates :nombre, presence: true

  # CLASS METHODS

  # INSTANCE METHODS

  def can_delete?
    programas.empty? && estaciones.empty?
  end

  # ALIASES

  alias_attribute :to_s, :nombre
  alias_attribute :to_label, :nombre

  # PRIVATE METHODS

  private

end
