class CreateFoodEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :food_entries do |t|
      t.datetime :entry_date
      t.references :food, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
