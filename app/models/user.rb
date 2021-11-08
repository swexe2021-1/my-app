class User < ApplicationRecord
    validates :uid, uniqueness: true
    validates :password, presence: true, confirmation: true
    has_many :reviews, dependent: :destroy
    
    attr_accessor :password, :password_confirmation

    def password=(val)
        if val.present?
            self.pass = BCrypt::Password.create(val)
        end
    @password = val
    end
end
