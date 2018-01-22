class SolicitudDecorator < ApplicationDecorator
  delegate_all

  ESTADOS = {
    Solicitud::PENDIENTE => 'label-warning',
    Solicitud::EN_CURSO => 'label-primary',
    Solicitud::CERRADO => 'label-success'
  }

  URGENCIAS = {
    Solicitud::MUY_BAJA => 'label-default',
    Solicitud::BAJA => 'label-info',
    Solicitud::MEDIA => 'label-primary',
    Solicitud::ALTA => 'label-warning',
    Solicitud::MUY_ALTA => 'label-danger'
  }

  def estado_label
    h.tag.span object.estado.humanize.upcase, class: ['label', ESTADOS[object.estado]]
  end

  def urgencia_label
    h.tag.span object.urgencia.humanize.upcase, class: ['label', URGENCIAS[object.urgencia]]
  end

  def items_label
    h.fa_icon(:plus, class: 'fa-fw', text: h.pluralize(object.items_count, 'item', 'items'))
  end

  def novedades_label
    h.fa_icon(:plus, class: 'fa-fw', text: h.pluralize(object.novedades_count, 'novedad', 'novedades'))
  end
end
