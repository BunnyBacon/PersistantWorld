class UploadsController < ApplicationController

# 	shows all the current uploads by going to path: user_uploads_path
	def index
		require_user
		@uploads = current_user.uploads
	end

#   return an HTML form for creating a new upload belonging to a specific user via: new_user_upload_path 
	def new
		require_user
		@upload = Upload.new
	end

#	create a new upload belonging to a specific user via: 
	def create
		require_user
		@uploads = Upload.new(params[:upload])
		current_user.uploads << @uploads
		@uploads.user_id = current_user.id

		if @uploads.save && current_user.save
			redirect_to user_uploads_path, :notice => "Upload saved!"
		else
			redirect_to user_uploads_path, :notice => "Upload cannot be saved!"
		end
	end

#   display a specific upload belonging to a specific user via: 
	def show
		require_user
		@uploads = current_user.uploads
	end

#   return an HTML form for editing an upload belonging to a specific user via: 
	def edit
		require_user
		@uploads = current_user.uploads
	end

#   update a specific upload belonging to a specific user via: 
	def update
		require_user
		@uploads = current_user.uploads
	end

#   delete a specific upload belonging to a specific user via: 
	def destroy
		require_user
		@uploads = current_user.uploads
	end

end