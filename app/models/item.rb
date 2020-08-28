class Item < ApplicationRecord
  has_many :user_items
  
  
  # has_many :recipes, through: :recipeitems
  
  
  
end

