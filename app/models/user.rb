class User < ApplicationRecord
    has_many :posts
    has_secure_password
    
    validates :email, presence: true, uniqueness: true
end
