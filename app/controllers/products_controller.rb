class ProductsController < ApplicationController
  before_action :require_sign_in, only: [:new, :create, :edit, :update, :delete, :destroy]
  before_action :require_correct_user, only: [:edit, :update, :delete, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :delete, :destroy]

  def show
    @title = @product.title
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
  end

  def destroy
    if @product.destroy
      redirect_to current_user, notice: "Product deleted"
    end
  end

  private

    def product_params
      params.require(:product).permit(:title, :location, :price, :image, :description)
    end

    def require_correct_user
      @product = Product.find_by!(slug: params[:id])
      @user = @product.user
      redirect_to root_url unless correct_user?(@user)
    end

    def set_product
      @product = Product.find_by!(slug: params[:id])
    end
end
