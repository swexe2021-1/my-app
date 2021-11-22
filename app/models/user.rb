class User < ApplicationRecord
    validates :uid, uniqueness: true
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password, length: { minimum: 6 },format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'}, presence: true, confirmation: true
    has_many :reviews, dependent: :destroy
    
    attr_accessor :password, :password_confirmation

    def password=(val)
        if val.present?
            self.pass = BCrypt::Password.create(val)
        end
    @password = val
    end
end
