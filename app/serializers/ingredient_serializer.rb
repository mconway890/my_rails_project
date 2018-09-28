class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :recipe_ingredients, serializer: RecipeIngredientSerializer

  def self.serialize(ingredient)
    serialized_ingredient = '{'
    serialized_ingredient += '"id": ' + ingredient.id.to_s + ', '
    serialized_ingredient += '"name": ' + ingredient.name + ', '
    serialized_ingredient += '}'
  end
end
