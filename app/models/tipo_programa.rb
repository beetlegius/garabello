class TipoPrograma < ApplicationRecord

  # CONFIG

  include Destroyable

  # CALLBACKS

  # RELATIONS

  has_many :programas
  has_many :cuadrillas

  has_and_belongs_to_many :tareas
  has_and_belongs_to_many :recursos

  # SCOPES

  # VALIDATIONS

  validates :nombre, presence: true

  # CLASS METHODS

  # INSTANCE METHODS

  def can_delete?
    programas.empty?
  end

  # ALIASES

  alias_attribute :to_label, :nombre
  alias_attribute :to_s, :nombre

  # PRIVATE METHODS

  private

end
