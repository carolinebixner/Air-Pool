class ReviewsController < ApplicationController
  def create
    if !current_user
      redirect_to new_user_session_path
    else
      @review = Review.new(review_params)
      @review.user_id = current_user.id
      @review.pool_id = params["pool_id"]
      @pool = @review.pool
      if @review.save
        redirect_to pool_path(@pool, anchor: "submit-review-button")
      end
    end
  end

  private

  def review_params
     params.require(:review).permit(:description, :rating)
  end
end
