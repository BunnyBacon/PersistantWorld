class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username
    	t.string :email
    	t.string :password
    	t.string :persistence_token
    	t.string :perishable_token
    	t.string :single_access_token
      t.timestamps
    end
  end
end
