class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      flash[:success] = "Recipe Added!"
      redirect_to user_recipe_path
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :prep_time, :cook_time)
  end
end
