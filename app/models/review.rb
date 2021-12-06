class Review < ApplicationRecord
    belongs_to :user
    validates :prefecture, presence: true
    validates :city, presence: true
    validates :district, presence: true
    validates :star, presence: true
end
