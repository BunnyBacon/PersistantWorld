class Inbox < ActiveRecord::Base
	has_many :mails
	belongs_to :user

	accepts_nested_attributes_for :mails

	def check_for_unread
		self.mails.each do |m|
			if m.unread
				return true
			end
		end
		return false
	end
end
