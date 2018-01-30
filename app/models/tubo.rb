class Tubo < Seccion

  # CONFIG

  # CALLBACKS

  # RELATIONS

  # SCOPES

  # VALIDATIONS

  validates :diametro, presence: true, numericality: { greater_than: 0 }

  # CLASS METHODS

  # INSTANCE METHODS

  # ALIASES

  # PRIVATE METHODS

  private

end
