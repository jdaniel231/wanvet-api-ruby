class User < ApplicationRecord
    has_secure_password
    acts_as_paranoid

    enum role: { admin: 0, doctor: 1, frontdesk: 2 }

    validates_presence_of :name, :email, :password_digest
    validates_uniqueness_of :email
end
