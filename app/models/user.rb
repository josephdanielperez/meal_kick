class User < ApplicationRecord
    has_many :recipes 
    has_many :comments 
    has_many  :commented_recipes, through: :comments, source: :recipe 
    has_secure_password
    

end
