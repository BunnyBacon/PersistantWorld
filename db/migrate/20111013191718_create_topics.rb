class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
    	t.string :status
    	t.boolean :private
      t.timestamps
    end
  end
end
