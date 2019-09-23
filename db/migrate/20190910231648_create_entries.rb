class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.datetime :entry_date
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
