class Producto < ApplicationRecord

  # CONFIG

  include Destroyable

  # CALLBACKS

  # RELATIONS

  belongs_to :cip, optional: true, counter_cache: true
  has_many :items_movimiento
  has_many :items_solicitud

  # SCOPES

  scope :disponible, -> { where "cantidad > 0" }
  scope :solicitado, -> { joins(:items_solicitud) }

  # VALIDATIONS

  validates :codigo, presence: true, uniqueness: true

  # CLASS METHODS

  class << self

    def to_csv
      attributes = %w{codigo nombre cantidad}

      CSV.generate(headers: true) do |csv|
        csv << attributes

        all.each do |producto|
          csv << attributes.map { |attr| producto.send(attr) }
        end
      end
    end

  end

  # INSTANCE METHODS

  # ALIASES

  alias_attribute :to_s, :nombre
  alias_attribute :to_label, :codigo

  # PRIVATE METHODS

  private

end
