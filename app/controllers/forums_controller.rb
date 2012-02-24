class ForumsController < ApplicationController
	def new
		@forum = Forum.new
	end

	def create
		@forum = Forum.new(params[:forum])

		if @forum.save
			redirect_to @forum, notice: "The Forum has been created!"
		else
			render "new"
		end
	end

	def index
		@forums = Forum.all
	end

	def show
		@forum = Forum.find(params[:id])
	end
end
