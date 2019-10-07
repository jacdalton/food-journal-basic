class CreateCalorieGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :calorie_goals do |t|
      t.float :calories
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
