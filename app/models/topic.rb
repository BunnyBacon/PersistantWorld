class Topic < ActiveRecord::Base
	has_many :posts
	belongs_to :forum
	has_and_belongs_to_many :users
	acts_as_messagable

	validates :title, :presence => true

	accepts_nested_attributes_for :posts

	def send_message_to_subscribers(message)
		# Not yet implemented
	end

	def send_inactivity_message
		# Not yet implemented
	end
end

#I decided to use the friendslist model in order to recycle. (Habit from C++ days). 
# These will be used for 2 lists. 
# Num 0 will be players allowed to add posts. 
# Num 1, will be those subscribed to those posts who get a message.
# User positioned in Lists[0].users[0] will be the GM. Or thread starter.
# Also added an inactivity system. I need to come up with a way to send that message only once. The check should probably happen once every night.