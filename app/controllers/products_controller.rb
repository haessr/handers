class ProductsController < ApplicationController

  def index

    if params[:query].present?
      sql_query = "title ILIKE :query OR description ILIKE :query"
      @products = Product.where(sql_query, query: "%#{params[:query]}%")
    else
      @products = Product.all
    end
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])

    @marker = { lat: @product.latitude, lng: @product.longitude }
  end

  def create
    @product = Product.new(product_params)
    @user = current_user
    @product.user = @user
    raise
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
    params.require(:product).permit(:title, :description, :location, :category, :price, photos: [])

  end
end
