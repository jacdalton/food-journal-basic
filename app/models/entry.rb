class Entry < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :foods

  validates :entry_date, presence: true, uniqueness: { scope: :user }

  def start_time
    self.entry_date
  end

  def sum_calories
    self.foods.map { |f| f.calories }.sum
  end

end
