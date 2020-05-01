class User < ApplicationRecord
    validates :email, :username, uniqueness: true, presence: true
    validates :username, length: { in: 4..15 }
    validates :password, presence: true, length: { minimum: 6 }
        
end
