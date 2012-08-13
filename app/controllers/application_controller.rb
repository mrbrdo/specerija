class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :auth_check

  private
    def auth_check
      if !user_signed_in? &&
         !controller_name.start_with?("devise", "sessions")
        redirect_to new_user_session_url, notice: "Please log in first."
      end
    end
end
