class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    if user_signed_in?
      @review = Review.new(review_params)
      @review.recipe = Recipe.find_by(id: params[:recipe_id])
      @review.user = current_user
      if @review.save
        flash[:success] = "Review added."
        @recipe = @review.recipe
        redirect_to @recipe
      else
        redirect_back(fallback_location: root_path)
      end
    else
      redirect_to new_user_session_path, alert: "You must be logged in to leave a review"
    end
  end

  private

  def review_params
    params.require(:review).permit(:difficulty, :description, :reviewer, :recipe_id)
  end
end
