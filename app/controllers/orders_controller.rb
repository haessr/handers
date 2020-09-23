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
    @product = @order.product

    authorize @order

    if @order.save
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: @product.title,
          amount: @order.price_cents,
          currency: 'eur',
          quantity: 1
        }],
        success_url: order_url(@order),
        cancel_url: order_url(@order)
      )    
      @order.update(checkout_session_id: session.id)
      redirect_to new_order_payment_path(@order)
      # redirect_to order_path(@order)
    else

      render :template => "products/show"

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
