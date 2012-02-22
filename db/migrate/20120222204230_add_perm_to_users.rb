class AddPermToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :perms, :integer
  end
end
