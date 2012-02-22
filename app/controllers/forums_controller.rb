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

end
