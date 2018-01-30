class EstadoSeccion < ApplicationRecord

  # CONFIG

  ESTADOS = %w(bueno regular malo)

  enum estado: ESTADOS

  # CALLBACKS

  # RELATIONS

  belongs_to :seccion
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
