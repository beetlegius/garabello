class TrabajoPAM < Trabajo

  # CONFIG

  # CALLBACKS

  # RELATIONS

  # SCOPES

  # VALIDATIONS

  validates :cantidad_estimada, presence: true

  # CLASS METHODS

  # INSTANCE METHODS

  def field_class
    'info'
  end

  def color
    'text-primary'
  end

  # ALIASES

  # PRIVATE METHODS

  private

end
