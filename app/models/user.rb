class User < ApplicationRecord
    has_many :recipes 
    has_many :comments 
    has_many :commented_recipes, through: :comments, source: :recipe 
    has_many :categories, through: :recipes

    has_secure_password 
    
    validates :username, presence: true, length: { in: 3..18 }
    validates :email, presence: true 
    validates :email, uniqueness: true
    scope :order_recipes, -> {order(:title)}

   
    def self.most_recipes
        joins(:recipes).group(:user_id).order("count(user_id) DESC").limit(3)
    end

    

end
