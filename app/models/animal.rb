class Animal < ApplicationRecord
  belongs_to :client
  has_many :animals
end
