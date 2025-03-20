class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create
    user = User.find_by(phone: params[:phone])

    if user && user.authenticate(params[:password])
      sign_in(user.id)
      destination = session[:intended_url]
      session[:intended_url] = nil
      redirect_to (destination || user)
    else
      flash.now[:alert] = "Invalid phone/password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    user = current_user
    sign_out
    redirect_to user
  end
end
