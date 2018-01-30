class Estacion < ApplicationRecord

  # CONFIG

  acts_as_list column: :posicion, scope: [deleted_at: nil]

  include Destroyable

  # CALLBACKS

  # RELATIONS

  has_and_belongs_to_many :ramales

  # SCOPES

  # VALIDATIONS

  validates :nombre, presence: true, uniqueness: true

  # CLASS METHODS

  # INSTANCE METHODS

  # ALIASES

  alias_attribute :to_label, :nombre
  alias_attribute :to_s, :nombre

  # PRIVATE METHODS

  private

end
