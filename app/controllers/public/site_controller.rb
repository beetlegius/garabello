module Public
  class SiteController < BaseController

    def index
      redirect_to admin_root_path if signed_in?
    end

  end
end
