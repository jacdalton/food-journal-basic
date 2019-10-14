class Entry < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :foods, -> { distinct } do
    def << (food)
      super food rescue ActiveRecord::RecordNotUnique
    end
  end

  validates :entry_date, presence: true, uniqueness: { scope: :user }

  def start_time
    self.entry_date
  end

  def sum_calories
    self.foods.map { |f| f.calories }.sum
  end

end
