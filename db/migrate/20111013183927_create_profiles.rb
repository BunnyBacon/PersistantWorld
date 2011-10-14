class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.string :firstname
    	t.string :lastname
    	t.string :favorite_system
    	t.string :favorite_class
    	t.string :favorite_alignment
    	t.string :favorite_race
    	t.string :favorite_genre
    	t.integer :number_of_games_played
    	t.integer :number_of_games_run
    	t.text :homebrew_rules
    	t.text :about_me
    	t.text :signature
    	t.string :avatar_file_name
    	t.integer :avatar_file_size
    	t.datetime :avatar_updated_at
      t.timestamps
    end
  end
end
