class InboxesController < ApplicationController
	def show
		@inbox = Inbox.find(params[:id])
	end

	def new
		@inbox = Inbox.new
	end

	def destroy
		# Iterate through all the mail and destroy them? Then destroy the inbox?
	end

	def create
		@inbox = Inbox.new(params[:id])
	end

	def update
		# Decide on how this is going to be used
	end
end
