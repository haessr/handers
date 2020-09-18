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
      redirect_to orders_path
    else
      redirect_to product_path(@order.product)
    end

  end

  private

  def order_params
    params.require(:order).permit(:product_id, :user_id, :price, :npo, :status)
  end

end
