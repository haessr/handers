class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    @user = current_user
    @product.user = @user

    if @product.save
      redirect_to product_path(@product)

    else
      render :new
    end
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
  end


  private

  def product_params
    params.require(:product).permit(:name, :description, :location, :category, :price)

  end
end
