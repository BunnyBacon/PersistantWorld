class CreateInboxes < ActiveRecord::Migration
  def change
    create_table :inboxes do |t|
    	t.string :name
      t.timestamps
    end
  end
end
