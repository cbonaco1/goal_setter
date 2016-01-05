class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, null: false, index: true
      t.integer :user_id, null: false, index: true
      t.text :description
      t.boolean :private?, default: true, null: false
      t.boolean :complete?, default: false, null: false
    end
  end
end
