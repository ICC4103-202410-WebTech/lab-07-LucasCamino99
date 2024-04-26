class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 6 }
    
    def self.find_by_full_name(first_name, last_name)
        where(first_name: first_name, last_name: last_name)
    end
end