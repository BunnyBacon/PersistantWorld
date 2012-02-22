class EditPosts < ActiveRecord::Migration
  def up
  	remove_column :posts, :author

  	add_column :posts, :user_id, :integer
  	add_column :posts, :topic_id, :integer
  end

  def down
  	remove_column :posts, :user_id
  	remove_column :posts, :topic_id

  	add_column :posts, :author, :integer
  end
end
