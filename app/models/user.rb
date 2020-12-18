# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username
  validates_presence_of :email
  validates :password_confirmation, presence: true
  validates :username, uniqueness: true, length: { minimum: 4 }
  has_many :cars, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
