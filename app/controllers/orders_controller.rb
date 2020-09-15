class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create

    @order = Order.new(order_params)
    @order.user = current_user

    if @order.save
      redirect_to order_path(@order)
    else
      redirect_to product_path(@order.product)
    end
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :user_id, :price, :status)
  end



end
