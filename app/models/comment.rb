class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :tweet

    validates :body, presence: true
    validates :tweet_id, presence: true
    validates :user_id, presence: true
end
