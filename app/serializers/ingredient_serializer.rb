class IngredientSerializer < ActiveModel::Serializer
  # attributes returned in JSON response
  attributes :id, :name, :recipe_ids
  has_many :recipes
end
