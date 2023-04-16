class Animal < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :client
  has_many :services
end
