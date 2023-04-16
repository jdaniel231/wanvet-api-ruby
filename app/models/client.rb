class Client < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :user

  has_many :animals, dependent: :destroy
  
  accepts_nested_attributes_for :animals, allow_destroy: true
end
