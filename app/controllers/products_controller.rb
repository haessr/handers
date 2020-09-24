class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  skip_before_action :authenticate_user!, only: [:index]

  def index

    if params[:query].present?
      sql_query = "title ILIKE :query OR description ILIKE :query"
      @products = policy_scope(Product).where(sql_query, query: "%#{params[:query]}%").order(created_at: :desc)
      # @products = Product.where(sql_query, query: "%#{params[:query]}%")
    else
      # @products = Product.all
      @products = policy_scope(Product).order(created_at: :desc)
    end
  end

  def show
    @order = Order.new
    @product = Product.find(params[:id])
    if current_user
      if Chatroom.where(user_id: current_user.id, product_id: params[:id]).first.nil?
        @chatroom_id = nil
      else
        @chatroom_id = Chatroom.where(user_id: current_user.id, product_id: params[:id]).first.id
      end
    end
    authorize @product

    @markers = [ lat: @product.latitude, lng: @product.longitude ]
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create

    @product = Product.new(product_params)
    @product.user = current_user

    authorize @product

    if @product.save
      redirect_to product_path(@product)

    else
      render :new
    end

  end

  def edit
    @product = Product.find(params[:id])
    authorize @product
  end

  def update
    @product = Product.find(params[:id])
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

  def owned

    @owned_products = current_user.owned_products
    authorize @owned_products

  end


  private

  def product_params
    params.require(:product).permit(:title, :description, :location, :category, :min_price, :npo_id, photos: [])

  end
end
