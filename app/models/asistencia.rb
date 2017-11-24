class Asistencia < ApplicationRecord

  # CONFIG

  include Destroyable

  # CALLBACKS

  # RELATIONS

  belongs_to :programa
  belongs_to :empleado, counter_cache: true

  # SCOPES

  # VALIDATIONS

  validates :cantidad_presence, :cantidad_ausente, :cantidad_ausente_sin_aviso, :recargo_horas, numericality: { greater_than_or_equal_to: 0, allow_nil: true }

  # CLASS METHODS

  # INSTANCE METHODS

  # ALIASES

  # PRIVATE METHODS

  private

end
