class CreateMails < ActiveRecord::Migration
  def change
    create_table :mails do |t|
    	t.string :author
    	t.string :recipient
    	t.text :message
    	t.datetime :sent_at
    	t.integer :parent_id
      t.boolean :unread
      t.timestamps
    end
  end
end
