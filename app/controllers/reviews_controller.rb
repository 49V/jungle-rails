class ReviewsController < ApplicationController

  before_action :authorize

  def create
    review_values = review_params 
    review_values[:product_id] = params[:product_id]
    @review = Review.new(review_values)
    @review.user = current_user    
    product = Product.find(review_values[:product_id])

    if @review.save
      flash[:success] = "Review created."
      redirect_to [@review.product]
    else
      render product
    end
  end

  def destroy
      @review = Review.find(params[:id])
      @review.destroy
      flash[:success] = "Review deleted."
      redirect_to [@review.product]
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating,
      :product_id,
      :user_id
    )
  end

end
