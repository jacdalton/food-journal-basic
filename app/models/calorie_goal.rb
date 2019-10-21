class CalorieGoal < ApplicationRecord
  belongs_to :user

  validates :calories, presence: true

  def self.max_calories(user, date)
    q_date = DateTime.new(date.year, date.month, date.day, 23, 59, 59)
    where('user_id = ? and created_at < ?', user, q_date).order(created_at: :desc).first
  end
end
