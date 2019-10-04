class Entry < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :foods

  validates :entry_date, presence: true, uniqueness: { scope: :user }
end
