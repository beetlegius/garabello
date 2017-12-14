class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def set_variables(*args)
    @variables = args.extract_options!
    @variables.reverse_merge! title: "#{controller_name}/#{action_name}"
  end

  helper_method :variables
  def variables
    @variables ||= set_variables
  end

end
