class User < ApplicationRecord
    has_secure_password
    has_many :projects

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true, format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :password, length: {in: 5..20}

    def full_name
        self.first_name + " " + self.last_name
    end

    def self.from_omniauth(auth)
        # Creates a new user only if it doesn't exist
        where(email: auth.info.email).first_or_initialize do |user|
          user.name = auth.info.name
          user.email = auth.info.email
        end
    end
end
