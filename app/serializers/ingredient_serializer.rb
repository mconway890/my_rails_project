class IngredientSerializer < ActiveModel::Serializer
  # attributes returned in JSON response
  attributes :id, :name
end
