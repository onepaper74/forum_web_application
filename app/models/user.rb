class User < ApplicationRecord
    has_secure_password
    
    has_one :profile, dependent: :destroy
    accepts_nested_attributes_for :profile
    
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    
    has_many :liked_posts, through: :likes, source: :post
    
    validates :username, presence: true
    validates :email, presence: true, uniqueness: true
end
