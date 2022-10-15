class Entity < ApplicationRecord
  belongs_to :user
  has_many :groups


  validates :name, presence: true
  validates :amount, presence: true, numericality: true, length: { maximum: 10 }
end
