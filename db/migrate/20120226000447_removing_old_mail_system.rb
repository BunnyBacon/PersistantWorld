class RemovingOldMailSystem < ActiveRecord::Migration
  def change
  	drop_table :mails
  	drop_table :inboxes
  end
end
