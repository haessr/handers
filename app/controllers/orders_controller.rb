class OrdersController < ApplicationController

  def index
    # @orders = Order.all
    @orders = policy_scope(Order).includes(:product)
    @buyer_orders = @orders.where(user_id: current_user.id)
    @seller_orders = @orders.where(products: {user_id: current_user.id})
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def create

    @order = Order.new(order_params)
    @order.user = current_user
    authorize @order

    if @order.save
      redirect_to order_path(@order)
    else
      redirect_to products_path(@product)
    end

  end

  def edit
    @order = Order.find(params[:id])
    authorize @order
  end


  def update
    @order = Order.find(params[:id])

    authorize @order

    @order.update(order_params)

    redirect_to order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :user_id, :price, :npo_id, :status)
  end

end
