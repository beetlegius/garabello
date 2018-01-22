class ItemSolicitudDecorator < ApplicationDecorator
  delegate_all

  def cantidad
    h.number_with_precision object.cantidad, precision: 2
  end
end
