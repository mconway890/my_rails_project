class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :description, :user_id
  belongs_to :user
end
