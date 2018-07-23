class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :reviews
  has_many :ingredients, through: :recipe_ingredients
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  validates :name, :prep_time, :cook_time, presence: true

  scope :quickest, -> { where('cook_time + prep_time < ?', 20) }

  def recipe_ingredients_attributes=(params)
    if self.save
    params.each do |k, recipe_ingredient|
        if !recipe_ingredient[:ingredient_id].empty?
          RecipeIngredient.create(quantity: recipe_ingredient[:quantity], ingredient_id: recipe_ingredient[:ingredient_id], recipe_id: self.id)
        elsif recipe_ingredient[:ingredient][:name].present?
          @ingredient = Ingredient.create(name: recipe_ingredient[:ingredient][:name])
          @recipe_ingredients = RecipeIngredient.create(quantity: recipe_ingredient[:quantity], recipe_id: self.id, ingredient_id: @ingredient.id)
        end
      end
    end
  end

  def delete_ingredients_from_recipe
      ingredients.size.times do
      ingredient = RecipeIngredient.find_by(recipe_id: self.id)
      ingredient.delete
    end
  end

    def add_ingredients_to_recipe(params)
      delete_ingredients_from_recipe
    params[:recipe_ingredients_attributes].each do |k, recipe_ingredient|

      if recipe_ingredient[:ingredient][:name].present?
        ingredient_name = recipe_ingredient[:ingredient][:name].downcase
        ingredient = Ingredient.find_or_create_by(name: ingredient_name)
      elsif recipe_ingredient[:ingredient_id].present?
        ingredient = Ingredient.find_by(id: recipe_ingredient[:ingredient_id])
      end

      if recipe_ingredient[:quantity].present?
        RecipeIngredient.create(quantity: recipe_ingredient[:quantity], ingredient_id: ingredient.id, recipe_id: self.id )
      end

    end
  end

  def total_time
    cook_time + prep_time
  end
end
