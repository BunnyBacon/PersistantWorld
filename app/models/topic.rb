class Topic < ActiveRecord::Base
	has_many :posts

	def send_message_to_subscribers(message)
		# TODO: ITERATE THROUGH ALL THE SUBSCRIBERS AND SEND MESSAGE
	end

	def send_message_to_authors(message)
		# TODO: ITERATE THROUGH ALL THE POSTS' AUTHORS AND SEND MESSAGE
	end
end
