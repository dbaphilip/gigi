class UsersController < ApplicationController
  before_action :require_sign_in, only: [:edit, :update, :delete, :destroy]
  before_action :require_correct_user, only: [:edit, :update, :delete, :destroy]

  def index
    @title = "Users"
    @users = User.order("created_at desc")
  end

  def show
    @user = User.find_by!(slug: params[:id])
    @title = @user.name
    
    if correct_user?(@user) 
      @products = @user.products.order("created_at desc")
    elsif @user.products.size == 1
      redirect_to product_path(@user.products.first)
    else
      @products = @user.products.order("created_at desc")
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    colors = [
      "#e74c3c", 
      "#c0392b", 
      "#8e44ad", 
      "#2c3e50", 
      "#34495e", 
      "#f39c12", 
      "#d35400", 
      "#e67e22",
      "#16a085",
      "#27ae60",
      "#2980b9",
      "#273c75",
      "#192a56"
    ]
    idx = rand(0..(colors.size - 1))
    color = colors[idx]

    @user.color = color
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

    def require_correct_user
      @user = User.find_by!(slug: params[:id])
      redirect_to root_url unless correct_user?(@user)
    end

    def user_params
      params.require(:user).permit(:name, :phone, :location, :password, :password_confirmation)
    end
end
