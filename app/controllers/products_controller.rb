class ProductsController < ApplicationController

  def index
    @products = Product.all
  end



  def show
    @order = Order.new
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
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

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path

  end


  private

  def product_params
    params.require(:product).permit(:name, :description, :location, :category, :price)

  end
end
