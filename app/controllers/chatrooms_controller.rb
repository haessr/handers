class ChatroomsController < ApplicationController

  def index
    @chatrooms = policy_scope(Chatroom).all
    @chatrooms_to_show = current_user.chatrooms_as_buyer + current_user.chatrooms_as_seller
  end

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
