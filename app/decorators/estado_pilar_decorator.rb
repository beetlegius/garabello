class EstadoPilarDecorator < ApplicationDecorator
  delegate_all

  def estado
    case object.estado
    when 'bueno'
      h.tag.span h.fa_icon('check', class: 'fa-fw', text: 'bueno'), class: 'text-success text-uppercase'
    when 'regular'
      h.tag.span h.fa_icon('warning', class: 'fa-fw', text: 'regular'), class: 'text-warning text-uppercase'
    when 'malo'
      h.tag.span h.fa_icon('times', class: 'fa-fw', text: 'malo'), class: 'text-danger text-uppercase'
    end
  end

  def observaciones
    h.simple_format object.observaciones.presence || 'Sin observaciones'
  end

end
