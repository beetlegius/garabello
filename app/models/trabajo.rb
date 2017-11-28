class Trabajo < ApplicationRecord

  # CONFIG

  include Destroyable

  # CALLBACKS

  # RELATIONS

  belongs_to :programa, counter_cache: true
  belongs_to :tarea, counter_cache: true

  # SCOPES

  # VALIDATIONS

  validates :fecha, :cantidad_ejecutada, :km_desde, :km_hasta, presence: true
  validates :cantidad_ejecutada, :cantidad_estimada, numericality: { greater_than_or_equal_to: 0, allow_nil: true }

  # CLASS METHODS

  # INSTANCE METHODS

  # ALIASES

  alias_attribute :to_s, :fecha
  alias_attribute :to_label, :fecha

  # PRIVATE METHODS

  private

end