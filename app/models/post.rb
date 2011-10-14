class Post < ActiveRecord::Base
	def most_recent
		posts = Post.find(:all, :timestamp)
		return posts.first(5)
	end
end
