class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.search(params[:term])
    @ingredient = Ingredient.new
    respond_to do |format|
      format.html {render :index}
      format.json { render json: @ingredients }
      # GET /ingredients.json
    end
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      render json: @ingredient, status: 201
    else
      flash[:error] = "Error. Ingredient not added."
      render 'new'
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    respond_to do |format|
      format.html {render :show}
      format.json { render json: @ingredient }
      # GET /ingredients/1.json
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity, :recipe_id, :term)
  end
end
