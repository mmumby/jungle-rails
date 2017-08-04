class ReviewsController < ApplicationController
  # before_action :set_review, only: [:create]

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user

  if @review.save
    redirect_to [:products], notice: 'Review was successfully created!'
  else
    redirect_to [:products], notice: 'Review failed to save.'
  end
end

def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to [:products], notice: 'Review deleted!'
  end


private

  # def set_review
  #   @review = Review.find(params[:id])
  # end

  def review_params
    params.require(:review).permit(
      :rating,
      :description
      )
  end
end
