class AddDescriptionToForums < ActiveRecord::Migration
  def change
  	add_column :forums, :description, :string
  	add_column :forums, :perms, :integer
  	add_column :forums, :title, :string
  	add_column :topics, :description, :text

  	remove_column :topics, :short_url
  end
end
