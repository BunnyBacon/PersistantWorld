class ProfilesController < ApplicationController
	def show
		require_user #This checks to make sure that there is a current user.
		@profile = current_user.profile
	end

	def edit
		require_user
		@profile = current_user.profile
	end

	def update
		require_user
		@profile = current_user.profile

		if(@profile.update_attributes(params[:profile]))
			flash = "Profile Successfully Updated!"
			#this will show the data
			redirect_to @profile
		else
			redirect_to edit_profile_path
		end
	end
end
