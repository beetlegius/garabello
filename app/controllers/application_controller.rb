class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def set_variables(title = nil, description = nil)
    @variables = {
      title: title.presence || "#{controller_name}/#{action_name}",
      description: description
    }
  end

  helper_method :variables
  def variables
    @variables ||= set_variables
  end

end
