class EntryFood < ApplicationRecord
  belongs_to :entry
  belongs_to :food

  validates :entry, uniqueness: { scope: :food }
  validates :quantity, presence: true, numericality: { greater_than: 0}
end
