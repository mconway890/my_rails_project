class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    if user_signed_in?
      review = Review.new(review_params)
      review.recipe = Recipe.find_by(id: params[:id])
      review.user = current_user
      if review.save
        flash[:success] = "Review added."
        redirect_to recipe_path(@recipe.review)
      end
    else
      redirect_to new_user_session_path, alert: "You must be logged in to leave a review"
    end
  end

  def edit
    @review = Review.find_by(id: params[:id])
  end

  def update
    review = Review.find_by(id: params[:id])
    review.update(review_params)
    redirect_to recipes_path(review.recipe)
  end

  private

  def review_params
    params.require(:review).permit(:difficulty, :description)
  end
end
