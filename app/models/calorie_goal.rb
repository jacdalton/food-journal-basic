class CalorieGoal < ApplicationRecord
  belongs_to :user

  validates :calories, presence: true
end
