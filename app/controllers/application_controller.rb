class ApplicationController < ActionController::Base

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
end
