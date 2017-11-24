class Consumo < ApplicationRecord

  # CONFIG

  include Destroyable

  # CALLBACKS

  # RELATIONS

  belongs_to :recurso, counter_cache: true
  belongs_to :programa

  # SCOPES

  # VALIDATIONS

  validates :fecha, :cantidad, :km_desde, :km_hasta, presence: true
  validates :cantidad, numericality: { greater_than: 0 }

  # CLASS METHODS

  # INSTANCE METHODS

  # ALIASES

  alias_attribute :to_s, :fecha
  alias_attribute :to_label, :fecha

  # PRIVATE METHODS

  private

end
