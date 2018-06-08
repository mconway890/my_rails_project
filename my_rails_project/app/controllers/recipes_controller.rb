class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params) do |r|
      r.user = current_user
    end
    if @recipe.save
      flash[:success] = "Recipe Added!"
      redirect_to @recipe
    else
      flash[:error] = "Error. Recipe not added."
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :prep_time, :cook_time, :user_id)
  end
end
