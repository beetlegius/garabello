class Tramo < Seccion

  # CONFIG

  # CALLBACKS

  # RELATIONS

  # SCOPES

  # VALIDATIONS

  validates :metros, :luz, presence: true, numericality: { greater_than: 0 }

  # CLASS METHODS

  # INSTANCE METHODS

  # ALIASES

  # PRIVATE METHODS

  private

end
