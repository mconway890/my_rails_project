class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :recipes, :class_name => 'Recipe', :foreign_key => 'user_id'
  has_many :ingredients, through: :recipes
  has_many :reviews
end
