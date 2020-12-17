# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username
  validates_presence_of :email
  validates :password_confirmation, presence: true
  validates :username, uniqueness: true, length: { minimum: 4 }

  # validates :password,  confirmation: true
  # validates :password, presence: true, on: :create
  # def password=(plaintext)
      # encrypted= BCrypt::Password.create(plaintext)
      # byebug
      # self.password_digest=encrypted

      # self.create(username:username)
  # end

  # def authenticate(plaintext)
      # pw=BCrypt::Password.new(self.password_digest)
      # byebug
      # Eater.find_by(self.password_diget)
  #     pw == plaintext
  # end
end
