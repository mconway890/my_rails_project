class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]
  has_many :recipes, :class_name => 'Recipe', :foreign_key => 'user_id'
  has_many :ingredients, through: :recipes
  has_many :reviews

    def self.from_omniauth(auth)
      # Either create a User record or update it based on the provider (Google) and the UID
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.token = auth.credentials.token
        user.expires = auth.credentials.expires
        user.expires_at = auth.credentials.expires_at
        user.refresh_token = auth.credentials.refresh_token
        user.email = auth.info
      end
    end

end
