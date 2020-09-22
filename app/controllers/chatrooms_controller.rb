class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

  def create
    @chatroom = Chatroom.new(title: params[:title], product_id: params[:product_id] , user_id: params[:user_id])
    @product = Product.find(params[:product_id])
    authorize @chatroom

    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      redirect_to product_path(@product)
    end
  end
end
