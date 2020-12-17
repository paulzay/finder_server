class User < ApplicationRecord
    has_secure_password
    validates_presence_of :username
    validates :username, uniqueness: true, length: { minimum: 4 }
end
