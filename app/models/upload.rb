class Upload < ActiveRecord::Base
	belongs_to :user

		# Paperclip
has_attached_file :upload,
  	:styles => {
    :thumb=> "100x100#",
    :small  => "150x150>",
    :medium => "300x300>",
    :large =>   "400x400>" }

end