class TopicsController < ApplicationController
	def show
		@topic = Topic.find(params[:short_url])
	end

	def new
		@topic = Topic.new
	end

	def create
		@topic = Topic.new(params[:topic])
	end

	def destroy
		@topic = Topic.find(params[:id])
		@topic.destroy
	end

	def edit
		@topic = Topic.find(params[:id])
	end

	def update
		@topic = Topic.find(params[:id])

		if @topic.update_attributes(params[:topic])
			redirect_to @topic, notice: 'Your changes have been made successfully.'
		else
			redirect_to 'edit', notice: 'There was an error when trying to save. Check to make sure that your changes are valid.'
		end
	end
end
