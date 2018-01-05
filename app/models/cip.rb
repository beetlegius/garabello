class Cip < ApplicationRecord

  # CONFIG

  include Destroyable

  # CALLBACKS

  # RELATIONS

  has_many :productos

  # SCOPES

  # VALIDATIONS

  validates :codigo, :nombre, presence: true
  validates :codigo, uniqueness: true

  # CLASS METHODS

  # INSTANCE METHODS

  # ALIASES

  def to_label
    "#{codigo} (#{nombre})"
  end

  # PRIVATE METHODS

  private

end
