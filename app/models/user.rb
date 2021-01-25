class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username
  validates_presence_of :email
  validates :password, length: { minimum: 6 }, allow_nil: true
  validates :username, uniqueness: true, length: { minimum: 3 }
  has_many :cars, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
