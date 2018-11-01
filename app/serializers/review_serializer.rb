class ReviewSerializer < ActiveModel::Serializer
  # attributes returned in JSON response
  attributes :id, :description, :user_id
  belongs_to :recipe
  belongs_to :user
end
