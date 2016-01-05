class RenameGoalCommentUser < ActiveRecord::Migration
  def change
    remove_column :goal_comments, :user_id
    add_column :goal_comments, :author_id, :integer, null: false, index: true
  end
end
