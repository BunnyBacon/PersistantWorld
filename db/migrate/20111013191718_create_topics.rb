class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
    	t.string :status
    	t.string :title
    	t.string :short_url
    	t.boolean :private
    	t.datetime :last_updated
      t.timestamps
    end
  end
end
