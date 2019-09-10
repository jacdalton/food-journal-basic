class FoodEntry < ApplicationRecord
  belongs_to :user
  belongs_to :food

  validates :entry_date, presence: true
end
