class Topic < ActiveRecord::Base
	has_many :posts
	has_many :friendslists
	belongs_to :forum

	validates :title, :presence => true
	validates :short_url, :presence => true, :uniqueness => true

	accepts_nested_attributes_for :posts

	def setup(author)
		self.status = "Normal"

		plays = Friendslist.new
		plays.name = "Players"
		plays.users << author
		self.friendslists << plays

		subs = Friendslist.new
		subs.name = "Subscribers"
		subs.users << author
		self.friendslists << subs
	end

	def send_message_to_subscribers(message)
		self.friendslists[1].users.each do |usr|
			sage = Mail.new
			sage.recipient = usr.username
			sage.author = "Subscription Handler"
			sage.subject = "[Do Not Reply] The thread you subscribed to, #{self.title}, has been posted in!"
			sage.message = message.to_s
			sage.send
			sage.destroy
		end
	end

	def send_message_to_players(message)
		self.friendslists[0].users.each do |usr|
			sage = Mail.new
			sage.recipient = usr.username
			sage.author = "Subscription Handler"
			sage.subject = "[Do Not Reply] The thread you subscribed to, #{self.title}, has been posted in!"
			sage.message = message.to_s
			sage.send
			sage.destroy
		end
	end

	def send_inactivity_message
		message = Mail.new
		message.recipient = self.friendslists[0].users[0].username
		message.author = "Inactivity Handler"
		message.subject = "[Do Not Reply] Your thread is in jeopardy due to inactivity"
		message.message = "This message is to warn you that your thread has not had a post in 7 days. If it reaches 14 days of inactivity, it will be deleted. You will only recieve this message once. You can check on your topic by going to: <a href=\"http://www.persistentworld.net/#{self.short_url}/0\">http://www.persistentworld.net/#{self.short_url}/0</a>"
		message.send
		message.destroy
	end
end

#I decided to use the friendslist model in order to recycle. (Habit from C++ days). 
# These will be used for 2 lists. 
# Num 0 will be players allowed to add posts. 
# Num 1, will be those subscribed to those posts who get a message.
# User positioned in Lists[0].users[0] will be the GM. Or thread starter.
# Also added an inactivity system. I need to come up with a way to send that message only once. The check should probably happen once every night.