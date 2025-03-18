class ApplicationController < ActionController::Base

  private

    def sign_in(user_id)
      session[:user_id] = user_id
    end

    def sign_out
      session[:user_id] = nil
    end

    def current_user
      User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user

    def signed_in?
      if current_user
        true
      else
        false
      end
    end

    helper_method :signed_in?

    def require_sign_in
      unless signed_in?
        session[:intended_url] = request.url
        redirect_to sign_in_url, alert: "Please sign in"
      end
    end

    def correct_user?(user)
      if signed_in? && current_user.id == user.id
        return true
      else
        return false
      end
    end

    helper_method :correct_user?
end
