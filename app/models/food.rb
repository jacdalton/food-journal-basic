class Food < ApplicationRecord
  belongs_to :user
  has_many :entry_foods
  has_many :entries, through: :entry_foods

  validates :name, presence: true
  validates :calories, presence: true

  def get_quantity(entry_id)
    self.entry_foods.find_by_entry_id(entry_id).quantity
  end
end
