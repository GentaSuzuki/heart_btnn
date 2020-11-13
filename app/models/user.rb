class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true

         has_many :recipes, dependent: :destroy
         has_many :favorites, dependent: :destroy

         def already_check(recipe)
          self.favorites.exists?(recipe_id: recipe.id)
         end
end
