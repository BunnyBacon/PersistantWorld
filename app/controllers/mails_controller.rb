class MailsController < ApplicationController
	def show
		@mail = Mail.find(params[:id])
	end

	def new
		@mail = Mail.new
	end

	def create
		@mail = Mail.new(params[:mail])
	end

	def destroy
		# Consider where this would actually be used.
	end
end
