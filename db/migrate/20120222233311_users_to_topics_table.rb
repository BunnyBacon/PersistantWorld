class UsersToTopicsTable < ActiveRecord::Migration
  def up
  	create_table :users_topics do |t|
  		t.integer :user_id
  		t.integer :topic_id
  	end
  end

  def down
  	drop_table :users_topics
  end
end
