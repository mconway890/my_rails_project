class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:success] = "Ingredient Added!"
      redirect_to recipe_path
    else
      flash[:error] = "Error. Ingredient not added."
      render 'new'
    end
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity)
  end
end
