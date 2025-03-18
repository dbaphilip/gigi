class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :delete, :destroy]
  def index
    @users = User.order("created_at desc")
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user.id)
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
  end

  def destroy
    if @user.destroy
      sign_out
      redirect_to root_url
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :phone, :password, :password_confirmation)
    end
end
