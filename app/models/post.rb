class Post < ApplicationRecord
    belongs_to :user
    belongs_to :parent_post, class_name: 'Post', optional: true
    has_many :replies, class_name: 'Post', foreign_key: 'parent_post_id'
    has_many :post_tags
    has_many :tags, through: :post_tags
    validates :title, presence: true
    validates :content, presence: true
    validates :user_id, presence: true
    validates :answers_count, numericality: { greater_than_or_equal_to: 0 }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0 }
    validates :published_at, presence: true, default: -> { Time.current }
    validates :title, :content, :user_id, presence: { message: "must be provided" }

    def self.by_username(username)
        joins(:user).where('users.username LIKE ?', "%#{username}%")
    end
end