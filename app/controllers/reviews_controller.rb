class ReviewsController < ApplicationController
  before_action :set_review, only: :destroy
  before_action :must_login, only: [:create, :destroy]

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user

  if @review.save
    redirect_to :back, notice: 'Review was successfully created!'
  else
    redirect_to :back, notice: 'Review failed to save.'
  end
end

def destroy
    @review.destroy
    redirect_to :back
  end


private

  def must_login
    if !current_user
      redirect_to [:product]
    end
  end

  def set_review
    @review = Review.find params[:id]
  end

  def review_params
    params.require(:review).permit(
      :rating,
      :description
      )
  end
end
