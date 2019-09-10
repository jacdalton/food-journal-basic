class Food < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :calories, presence: true
end
