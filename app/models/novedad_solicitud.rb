class NovedadSolicitud < ApplicationRecord

  # CONFIG

  include Destroyable

  # CALLBACKS

  after_initialize :set_fecha

  # RELATIONS

  belongs_to :user
  belongs_to :solicitud, counter_cache: :novedades_count

  # SCOPES

  # VALIDATIONS

  validates :fecha, :contenido, presence: true

  # CLASS METHODS

  # INSTANCE METHODS

  # ALIASES

  # PRIVATE METHODS

  private

  def set_fecha
    self.fecha ||= Date.today
  end

end
