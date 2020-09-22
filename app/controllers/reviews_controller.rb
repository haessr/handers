class ReviewsController < ApplicationController
  def index
    @reviews = policy_scope(Review).all
  end

  def new
    @review = Review.new
    @product = Product.find(params[:product_id])
    authorize @review
  end

  def create

    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product_id = @product.id
    authorize @review
    if @review.save
      redirect_to product_path(@product)
    else
      render :new
    end

  end

  def destroyshow
  end

  # def blank_stars
  #   5 - @user.review.rating.to_i
  #   authorize @review
  # end


   private

  def review_params
    params.require(:review).permit(:description, :rating, :product_id)
  end
end
