class Solicitud < ApplicationRecord

  # CONFIG

  include Destroyable

  enum categoria: CATEGORIAS = [SENALAMIENTO = 'señalamiento', VIA = 'via', OBRA_CIVIL = 'obra_civil', OBRA_DE_ARTE = 'obras_de_arte', COMUNICACIONES = 'comunicaciones']
  enum estado: ESTADOS = [PENDIENTE = 'pendiente', EN_CURSO = 'en_curso', CERRADO = 'cerrado']
  enum urgencia: URGENCIAS = [MUY_BAJA = 'muy_baja', BAJA = 'baja', MEDIA = 'media', ALTA = 'alta', MUY_ALTA = 'muy_alta']

  # CALLBACKS

  after_initialize :set_fecha
  after_initialize :set_estado
  after_initialize :set_urgencia

  # RELATIONS

  has_many :items, class_name: 'ItemSolicitud', dependent: :destroy
  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true
  has_many :productos, through: :items
  has_many :novedades, -> { order fecha: :desc }, class_name: 'NovedadSolicitud', dependent: :destroy
  accepts_nested_attributes_for :novedades, reject_if: :all_blank, allow_destroy: true

  # SCOPES

  # VALIDATIONS

  validates :estado, :urgencia, :categoria, :lugar, presence: true
  validates :estado,    inclusion: { in: ESTADOS }
  validates :urgencia,  inclusion: { in: URGENCIAS }
  validates :categoria, inclusion: { in: CATEGORIAS }
  validates :codigo_requerimiento, uniqueness: true, allow_blank: true

  # CLASS METHODS

  class << self

    def to_csv
      attributes = %w{fecha solicitud rc lugar estado urgencia cantidad codigo descripcion}

      CSV.generate(headers: true) do |csv|
        csv << attributes.map(&:humanize).map(&:upcase)

        all.decorate.each do |solicitud|
          solicitud.items.decorate.each do |item|
            csv << [
              solicitud.fecha,
              solicitud.codigo,
              solicitud.codigo_requerimiento,
              solicitud.lugar,
              solicitud.estado.humanize,
              solicitud.urgencia.humanize,
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

  def codigo
    "#{categoria.humanize.parameterize.upcase}-#{id.to_s.rjust(5, '0')}" if persisted?
  end

  # ALIASES

  alias_method :to_label, :codigo
  alias_method :to_s, :codigo

  # PRIVATE METHODS

  private

  def set_fecha
    self.fecha ||= Date.today
  end

  def set_estado
    self.estado ||= ESTADOS.first
  end

  def set_urgencia
    self.urgencia ||= MEDIA
  end

end
