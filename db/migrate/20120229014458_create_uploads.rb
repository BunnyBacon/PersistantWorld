class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
  	t.string 		:upload_file_name
    t.string 		:upload_content_type
    t.integer 	:upload_file_size
    t.boolean		:public
    t.string		:notes
    t.integer   :user_id
  
    t.timestamps
    end
  end
end
