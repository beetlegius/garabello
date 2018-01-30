class Foto < ApplicationRecord

  # CONFIG

  @files = %w(imagen)

  include Destroyable, Fileable

  # CALLBACKS

  # RELATIONS

  belongs_to :relevamiento

  # SCOPES

  # VALIDATIONS

  # CLASS METHODS

  # INSTANCE METHODS

  # ALIASES

  # PRIVATE METHODS

  private

end
