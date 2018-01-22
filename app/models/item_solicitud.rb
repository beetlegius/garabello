class ItemSolicitud < ApplicationRecord

  # CONFIG

  include Destroyable

  # CALLBACKS

  # RELATIONS

  belongs_to :producto
  belongs_to :solicitud, counter_cache: :items_count

  # SCOPES

  # VALIDATIONS

  validates :cantidad, presence: true, numericality: { greater_than: 0 }

  # CLASS METHODS

  # INSTANCE METHODS

  # ALIASES

  # PRIVATE METHODS

  private

end
