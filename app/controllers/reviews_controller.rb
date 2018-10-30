class ReviewsController < ApplicationController
  before_action :set_recipe

  def new
    @review = Review.new
  end

  def create
    if user_signed_in?
      @review = Review.new(review_params)
      @review.recipe = Recipe.find_by(id: params[:recipe_id])
      @review.user = current_user
      if @review.save
        #flash[:success] = "Review added."
        @recipe = @review.recipe
        respond_to do |format|
          format.html { redirect_to @recipe }
          format.js { }
        end
      else
        redirect_back(fallback_location: root_path)
      end
    else
      redirect_to new_user_session_path, alert: "You must be logged in to leave a review"
    end
  end

  private

  def set_recipe
    if @recipe.present?
      @recipe = Recipe.find(params[:recipe_id])
    end
  end

  def review_params
    params.require(:review).permit(:difficulty, :description, :reviewer, :recipe_id)
  end
end
