class User < ApplicationRecord
    has_secure_password
    has_many :projects

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, uniqueness: true
    validates :password, length: {in: 5..20}

    def full_name
        self.first_name + " " + self.last_name
    end
end
