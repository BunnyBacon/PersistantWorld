class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :topic

	def most_recent
		posts = Post.find(:all, :timestamp)
		return posts.first(5)
	end
end
