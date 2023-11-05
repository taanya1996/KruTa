class User < ApplicationRecord
    has_many :tweets, :dependent => :destroy
    has_many :comments, :dependent => :destroy
    validates :name, presence: true
    validates :email, presence: true
end
