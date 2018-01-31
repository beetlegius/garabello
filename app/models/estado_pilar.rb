class EstadoPilar < ApplicationRecord

  # CONFIG

  ESTADOS = %w(bueno regular malo)

  enum estado: ESTADOS

  # CALLBACKS

  # RELATIONS

  belongs_to :pilar
  belongs_to :relevamiento

  # SCOPES

  # VALIDATIONS

  validates :estado, presence: true, inclusion: { in: ESTADOS }

  # CLASS METHODS

  # INSTANCE METHODS

  # ALIASES

  # PRIVATE METHODS

  private

end
