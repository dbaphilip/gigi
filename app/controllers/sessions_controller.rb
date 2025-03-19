class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create
    user = User.find_by(phone: params[:phone])

    if user && user.authenticate(params[:password])
      sign_in(user.id)
      redirect_to (session[:intended_url] || user)
      session[:intended_url] = nil
    else
      flash.now[:alert] = "Invalid phone/password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out
    redirect_to request.referrer
  end
end
