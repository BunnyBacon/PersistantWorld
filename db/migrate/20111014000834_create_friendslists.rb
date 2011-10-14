class CreateFriendslists < ActiveRecord::Migration
  def change
    create_table :friendslists do |t|
    	t.integer :parent_id
    	t.string :name
      t.timestamps
    end
  end
end
