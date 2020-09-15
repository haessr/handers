class ProductsController < ApplicationController

  def index

    if params[:query].present?
      sql_query = "title ILIKE :query OR description ILIKE :query"
      @products = policy_scope(Product).where(sql_query, query: "%#{params[:query]}%")
      # @products = Product.where(sql_query, query: "%#{params[:query]}%")
    else
      # @products = Product.all
      @products = policy_scope(Product)
    end
  end



  def show
    @order = Order.new
    @product = Product.find(params[:id])
    authorize @product

    @marker = { lat: @product.latitude, lng: @product.longitude }
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create

    @product = Product.new(product_params)
    @user = current_user
    @product.user = @user

    authorize @product

    if @product.save
      redirect_to product_path(@product)

    else
      render :new
    end
  end

  def edit
    authorize @product
  end

  def update
    @product.update(product_params)

    authorize @product

    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    authorize @product

    redirect_to products_path

  end


  private

  def product_params
    params.require(:product).permit(:title, :description, :location, :category, :price, photos: [])

  end
end
