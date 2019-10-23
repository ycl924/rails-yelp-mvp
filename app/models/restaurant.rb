class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates_presence_of :name, :address, :category
  validates_uniqueness_of :name, :address
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }
end
