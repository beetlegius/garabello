module Admin
  class UsersController < BaseController
    load_and_authorize_resource

    def index
      respond_to do |format|
        format.html
        format.json { render json: UsersDatatable.new(view_context) }
      end
    end

    def show
    end

    def new
      render :form
    end

    def edit
      @user = current_user unless can? :manage, User
      render :form
    end

    def create
      @user.save!
      redirect_to admin_users_path, notice: t(action_name, scope: :notice)
    end

    def update
      @user = current_user unless can? :manage, User
      @user.update! user_params
      redirect_to admin_root_path, notice: t(action_name, link: can?(:manage, User) ? view_context.link_to('Volver', admin_users_path) : nil, scope: :notice)
    end

    def destroy
      if @user.destroy
        redirect_to admin_users_path, notice: t(action_name, scope: :notice)
      else
        redirect_to admin_users_path, alert: t(action_name, scope: :alert)
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :name, :image, :remove_image, :password, :password_confirmation)
    end

  end
end
