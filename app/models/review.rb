class Review < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  validates :difficulty, numericality: { only_integer: true }
end
