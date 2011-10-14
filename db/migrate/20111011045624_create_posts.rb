class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :author
      t.string :title
      t.text :body
      t.datetime :timestamp
      t.string :status

      t.timestamps
    end
  end
end
