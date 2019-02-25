class ReviewsController < ApplicationController

  def create
    review_values = review_params 
    review_values[:product_id] = params[:product_id]
    @review = Review.new(review_values)
    @review.user = current_user    
    product = Product.find(review_values[:product_id])

    if @review.save
      redirect_to [@review.product], notice: 'Review created!'
    else
      render product
    end
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
