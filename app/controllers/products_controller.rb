class ProductsController < ApplicationController
  before_action :require_sign_in, only: [:new]
  before_action :set_product, only: [:show]

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def product_params
      params.require(:product).permit(:title, :price, :description)
    end

    def set_product
      @product = Product.find(params[:id])
    end
end
