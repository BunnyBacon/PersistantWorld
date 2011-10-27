class CreateFriendslistUsersJoinTable < ActiveRecord::Migration
  def up
  	create_table :friendslists_users, :id => false do |t|
  		t.integer :friendslist_id
  		t.integer :user_id
  end

  def down
  	drop_table :friendslists_users
  end
end
