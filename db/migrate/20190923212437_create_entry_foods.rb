class CreateEntryFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :entry_foods do |t|
      t.float :quantity, default: 1.0
      t.references :food, foreign_key: true
      t.references :entry, foreign_key: true
      t.timestamps
    end
  end
end
