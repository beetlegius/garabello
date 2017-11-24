module Admin
  class BaseController < ApplicationController
    include Exceptions

    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from CanCan::AccessDenied, with: :access_denied

    before_action :authenticate_user!
    check_authorization
    before_action :set_info

    protected

    def set_info
      set_variables controller_name.gsub("Controller", "").classify.constantize.model_name.human
    end
  end
end
