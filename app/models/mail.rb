class Mail < ActiveRecord::Base
	validates :recipient, :presence => true
	validates :message, :presence => true

	def send
		sent_at = Time.now.to_datetime
		if recipient.include?(',') #check for multiple recipients
			recs = recipient.strip!
			arr = recs.split(',')
			arr.each do |r|
				user = User.find_by_username(r.to_s)
				if (user)
					user.recieve_mail(self)
				else
					send_fail_message(r)
				end
			end
		else #send to only one recipient
			user = User.find_by_username(recipient)
			if (user)
				user.recieve_mail(self)
			else
				send_fail_message(recipient)
			end
		end

		# Adding this message to the sent box.
		user = User.find_by_username(author)
		user.inboxes[2].mails << self
	end

	def send_fail_message(username)
		fail_message = Mail.new
		fail_message.recipient = author
		fail_message.author = "System Responder"
		fail_message.subject = "[Do Not Reply] Your message failed to send!"
		fail_message.message = "Sorry, the username #{username} does not exist. Please check to make sure that the spelling is correct or that the user has not deleted his/her account. Note that if the message had multiple recipients, the message was still sent to all other recipients provided this error does not occur."
		fail_message.send
		fail_message.destroy
	end
end
