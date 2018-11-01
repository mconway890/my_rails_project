class RecipeSerializer < ActiveModel::Serializer
  # attributes returned in JSON response
  attributes :user_id, :name, :prep_time, :cook_time, :instructions
  belongs_to :user
end
