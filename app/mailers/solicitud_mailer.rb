class SolicitudMailer < ApplicationMailer
  include ApplicationHelper

  def enviar(solicitud)
    @solicitud = solicitud
    @url = admin_solicitud_url(@solicitud)
    mail to: Rails.application.config.x.receptor_solicitudes, reply_to: Rails.application.config.x.email, subject: "SM #{@solicitud.codigo}"
  end
end
