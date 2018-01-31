class RelevamientoDecorator < ApplicationDecorator
  delegate_all

  %w(estado_bulones_de_amarre estado_contra_rieles estado_tacos_de_madera estado_nivelacion_de_cabeceras estado_durmientes estado_pintura estado_mamposteria_muro_lateral_ascendente estado_mamposteria_muro_lateral_descendente estado_mamposteria_muro_frontal_ascendente estado_mamposteria_muro_frontal_descendente estado_mamposteria_zapatas_ascendente estado_mamposteria_zapatas_descendente estado_vegetacion_muro_lateral_ascendente estado_vegetacion_muro_lateral_descendente estado_vegetacion_muro_frontal_ascendente estado_vegetacion_muro_frontal_descendente estado_vegetacion_zapatas_ascendente estado_vegetacion_zapatas_descendente estado_taludes_margen_izquierda_aguas_arriba estado_taludes_margen_derecha_aguas_arriba estado_taludes_margen_izquierda_aguas_abajo estado_taludes_margen_derecha_aguas_abajo estado_defensas_estribos_ascendente estado_defensas_estribos_descendente estado_cauce).each do |attr|
    define_method attr do
      case object.send(attr)
      when 'bueno'
        h.tag.span h.fa_icon('thumbs-up', class: 'fa-fw', text: 'bueno'), class: 'text-success text-uppercase'
      when 'regular'
        h.tag.span h.fa_icon('warning', class: 'fa-fw', text: 'regular'), class: 'text-warning text-uppercase'
      when 'malo'
        h.tag.span h.fa_icon('thumbs-down', class: 'fa-fw', text: 'malo'), class: 'text-danger text-uppercase'
      end
    end
  end

  def observaciones_durmientes
    h.simple_format object.observaciones_durmientes.presence || 'Sin observaciones'
  end

  def observaciones_pintura
    h.simple_format object.observaciones_pintura.presence || 'Sin observaciones'
  end

  def observaciones_pilares_estribos
    h.simple_format object.observaciones_pilares_estribos.presence || 'Sin observaciones'
  end

  def observaciones_pilares_defensas
    h.simple_format object.observaciones_pilares_defensas.presence || 'Sin observaciones'
  end

end
