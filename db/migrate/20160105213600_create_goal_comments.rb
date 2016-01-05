class CreateGoalComments < ActiveRecord::Migration
  def change
    create_table :goal_comments do |t|
      t.integer :goal_id, null: false, index: true
      t.integer :user_id, null: false, index: true
      t.text :body, null: false 

      t.timestamps null: false
    end
  end
end
