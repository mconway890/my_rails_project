class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  validates :name, presence: true

  def name_for_select
    name.downcase
  end

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      order('name ASC')
    end
  end
end
