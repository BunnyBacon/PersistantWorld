class UsersToTopicsTable < ActiveRecord::Migration
  def up
  	create_table :topics_users, :id => false do |t|
  		t.integer :user_id
  		t.integer :topic_id
  	end
  end

  def down
  	drop_table :topics_users
  end
end
