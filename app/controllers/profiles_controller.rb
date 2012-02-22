class ProfilesController < ApplicationController
	def show
		@profile = current_user.profile
	end

	def edit
		@profile = current_user.profile
	end

	def update
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
