class User < ActiveRecord::Base
	has_one :profile
	has_many :friendslist
	has_many :inboxes

	acts_as_authentic do |c|
		c.my_config_option = my_value
	end

	def recieve_mail(message)
		new_mail = Mail.new(message)
		new_mail.unread = true

		self.inboxes.first << new_mail
	end
end
