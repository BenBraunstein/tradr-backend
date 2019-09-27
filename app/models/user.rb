class User < ApplicationRecord
  has_many :items
  validates :username, :email, uniqueness: true
  validates :username, :email, :phone, presence: true
  has_secure_password
end
