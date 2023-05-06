class User < ApplicationRecord
    has_secure_password

    enum role: { admin: 0, doctor: 1, frontdesk: 2 }
    validates_presence_of :name, :email, :password_digest
end
