class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  belongs_to :user, foreign_key: 'user_id'
  validates :name, :prep_time, :cook_time, presence: true

  accepts_nested_attributes_for :ingredients, :recipe_ingredients
end
