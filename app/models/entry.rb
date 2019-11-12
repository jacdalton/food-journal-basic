class Entry < ApplicationRecord
  belongs_to :user
  has_many :entry_foods
  has_many :foods, through: :entry_foods

  validates :entry_date, presence: true, uniqueness: { scope: :user }

  def start_time
    self.entry_date
  end

  def sum_calories
    self.foods.map { |f| f.calories * f.entry_foods.find_by_entry_id(self).quantity }.sum
  end

end
