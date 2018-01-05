module Admin
  class BaseController < ApplicationController
    include Exceptions

    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from CanCan::AccessDenied, with: :access_denied

    before_action :authenticate_user!
    check_authorization
    before_action :set_info

    def root
      authorize! :root, :base
      case current_user.role
      when User::STORAGE
        redirect_to admin_productos_path
      when User::PROGRAM
        redirect_to admin_programas_path
      when User::ADMIN
        redirect_to admin_tareas_path
      when User::SUPERADMIN
        redirect_to admin_users_path
      end
    end

    protected

    def set_info
      set_variables title: 'Garabello' # controller_name.gsub("Controller", "").classify.constantize.model_name.human
    end
  end
end
