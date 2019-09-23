class Food < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :entries

  validates :name, presence: true
  validates :calories, presence: true
end
