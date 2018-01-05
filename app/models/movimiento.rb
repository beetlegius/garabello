class Movimiento < ApplicationRecord

  # CONFIG

  ESTADOS = [CONFIRMADA = :confirmada, PENDIENTE = :pendiente]

  include Destroyable

  # CALLBACKS

  after_initialize :set_fecha

  # RELATIONS

  belongs_to :user
  has_many :items, class_name: 'ItemMovimiento', dependent: :destroy, inverse_of: :movimiento
  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true
  has_many :productos, through: :items

  # SCOPES

  # VALIDATIONS

  # CLASS METHODS

  class << self

    def to_csv
      attributes = %w{fecha remito usuario cantidad codigo descripcion}

      CSV.generate(headers: true) do |csv|
        csv << attributes.map(&:humanize).map(&:upcase)

        all.each do |movimiento|
          movimiento.items.each do |item|
            csv << [
              movimiento.fecha,
              movimiento.remito,
              movimiento.user.name,
              item.cantidad,
              item.producto.codigo,
              item.producto.nombre
            ]
          end
        end
      end
    end

  end

  # INSTANCE METHODS

  def estado
    esta_confirmado? ? CONFIRMADA : PENDIENTE
  end

  def se_puede_confirmar?
    items.any? && !esta_confirmado?
  end

  def confirmar
    confirmar! if se_puede_confirmar?
  end

  def can_delete?
    !esta_confirmado?
  end

  # ALIASES

  # PRIVATE METHODS

  private

  def confirmar!
    transaction do
      items.each do |item|
        item.producto.increment! :cantidad, item.cantidad
      end
      update! esta_confirmado: true
    end
  end

  def set_fecha
    self.fecha ||= Date.today
  end

end
