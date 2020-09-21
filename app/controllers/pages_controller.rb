class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    if params[:id].present?
      @user = User.find(params[:id])
    else
      @user = current_user
    end

    @owned_products = @user.owned_products
    authorize @owned_products
  end

end
