class NoSessionController < ApplicationController
	# This controller and its corresponding views are pages that do not require a person to be logged in. The major being the site's index.

	def index
		@recent_posts = Posts.all.last(10)
		@recent_users = Users.all.last(10)
	end
end
