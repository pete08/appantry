class User < ApplicationRecord
  has_many :user_items

  has_secure_password
  validates :email, presence: true, uniqueness: true
end
