class Food < ApplicationRecord
  belongs_to :user
  has_many :food_entries

  validates :name, presence: true
  validates :calories, presence: true
end
