class IngredientsController < ApplicationController
  def index
    if params[:recipe_id]
      @ingredients = Recipe.find(params[:recipe_id]).ingredients
    else
      @ingredients = Ingredient.all
    end
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:success] = "Ingredient Added!"
      redirect_to ingredient_path(@ingredient)
    else
      flash[:error] = "Error. Ingredient not added."
      render 'new'
    end
  end

  def show
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update 
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity, :recipe_id)
  end
end
