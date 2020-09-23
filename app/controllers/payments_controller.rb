class PaymentsController < ApplicationController
  def new
    @order = current_user.orders.where(status: 'pending').find(params[:order_id])
    authorize @order
  end
end
