class CreateEntriesFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :entries_foods do |t|
      t.references :food, foreign_key: true
      t.references :entry, foreign_key: true
      t.timestamps
    end
  end
end
