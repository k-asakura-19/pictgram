class User < ApplicationRecord
  validates :name, length: { in: 1..15 }
  
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, length: { in: 8..32 }, 
  format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]/i }
      
  has_secure_password
  
  has_many :topics
end
