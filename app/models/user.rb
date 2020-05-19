class User < ApplicationRecord
    has_secure_password
    # validates :name, :username, :email, presence: true
    validates :name, :username, :email, presence: {message: "%{attribute} cannot be blank."}
    validates :username, length: {minimum: 6, maximum: 12, message: "%{attribute} must be between 6 and 12 characters long."}
    validates :username, uniqueness: {message: "%{attribute}s must be be unique, and %{value} has already been taken"}
end
