class ItemMovimiento < ApplicationRecord

  # CONFIG

  include Destroyable

  # CALLBACKS

  # RELATIONS

  belongs_to :movimiento, counter_cache: :items_count, inverse_of: :items
  belongs_to :producto

  # SCOPES

  # VALIDATIONS

  validates :cantidad, presence: true, numericality: { greater_than: 0 }

  # CLASS METHODS

  # INSTANCE METHODS

  def producto_codigo
    producto&.codigo
  end

  # ALIASES

  # PRIVATE METHODS

  private

end
