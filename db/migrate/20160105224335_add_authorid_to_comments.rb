class AddAuthoridToComments < ActiveRecord::Migration
  def change
    add_column :comments, :author_id, :integer, null: false, index: true
  end
end
