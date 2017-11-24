module Exceptions
  extend ActiveSupport::Concern

  def not_authenticated
    redirect_to new_user_session_path
  end

  def access_denied
    redirect_to new_user_session_path, alert: t(:access_denied, scope: :alert)
  end

  def routing_error
    redirect_to root_url
  end

  def record_invalid(exception)
    flash.now.alert = exception.message
    if exception.record && defined?(exception.record.class.files)
      exception.record.class.files.each do |attribute|
        exception.record.send "#{attribute}=", nil if exception.record.errors[attribute].any?
      end
    end

    case action_name
    when 'create' then
      new
    when 'update' then
      edit
    end
  end

end
