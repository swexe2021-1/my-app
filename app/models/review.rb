class Review < ApplicationRecord
    belongs_to :user
    validates :prefecture, presence: true
    validates :address, presence: true
    validates :district, presence: true
    validates :star, presence: true
    geocoded_by :address
    after_validation :geocode
end
