class Pilar < ApplicationRecord

  # CONFIG

  acts_as_list scope: [:estructura_id, deleted_at: nil], column: :posicion

  include Destroyable

  # CALLBACKS

  # RELATIONS

  belongs_to :estructura, counter_cache: true

  has_many :estados, class_name: 'EstadoPilar'
  has_many :relevamientos, through: :estados

  # SCOPES

  # VALIDATIONS

  # CLASS METHODS

  # INSTANCE METHODS

  # ALIASES

  # PRIVATE METHODS

  private

end
