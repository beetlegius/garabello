class Jornada < ApplicationRecord

  # CONFIG

  # CALLBACKS

  # RELATIONS

  belongs_to :programa, counter_cache: true
  has_many :trabajos

  # SCOPES

  default_scope -> { order :fecha }

  # VALIDATIONS

  validates :fecha, presence: true

  # CLASS METHODS

  # INSTANCE METHODS

  # ALIASES

  # PRIVATE METHODS

  private

end
