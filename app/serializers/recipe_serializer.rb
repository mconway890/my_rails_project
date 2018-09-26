class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :instructions, :prep_time, :cook_time
  belongs_to :user
end
