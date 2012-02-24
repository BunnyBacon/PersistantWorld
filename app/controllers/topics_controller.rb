class TopicsController < ApplicationController
	def show
		@topic = Topic.find(params[:id])
		#@forum = Forum.find(params[:forum_id])
	end

	def new
		@forum = Forum.find(params[:forum_id])
		@topic = @forum.topics.build
	end

	def create
		@forum = Forum.find(params[:forum_id])
		@topic = @forum.topics.build(params[:topic])

		if @topic.save
			@forum.save
			redirect_to forum_topic_path(@forum, @topic), notice: "New topic successfully created!"
		else
			render "new", notice: "The topic you created wasnt valid, please try again."
		end
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

	def confirm_sub
		# Get the current topic off the address bar, then appending it to the current user and vice-versa
		@topic = Topic.find(params[:id])
		current_user.topics << @topic
		@topic.users << current_user

		#Saving both changes to the database.
		current_user.save
		@topic.save

		redirect_to @topic, :notice => "Sucessfully subscribed!"
	end

	def subscribe
		@topic = Topic.find(params[:id])

		#Is the user already subscribed to this topic?
		if current_user.topics.include?(@topic)
			redirect_to @topic, :notice => "You are already subscribed to this topic."
		end
	end
end
