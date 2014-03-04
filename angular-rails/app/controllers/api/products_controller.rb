class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: @products
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      head :no_content
    else
      status :unprocessable_entity
    end
  end

  private
    def product_params
      params.require(:product).permit(:name)
    end
end