class Review < ApplicationRecord
    belongs_to :user
    validates :prefecture, presence: true
    validates :city, presence: true
    validates :district, presence: true
    validates :star, presence: true
    validates :star, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
