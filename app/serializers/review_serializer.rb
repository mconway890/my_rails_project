class ReviewSerializer < ActiveModel::Serializer
  # attributes returned in JSON response
  attributes :id, :description, :user_id, :recipe_id, :difficulty
  belongs_to :recipe
  belongs_to :user
end
