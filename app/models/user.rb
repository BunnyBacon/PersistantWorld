class User < ActiveRecord::Base
	has_one :profile
	has_one :dashboard
	has_and_belongs_to_many :friendslists
	has_many :inboxes
	has_attached_file :avatar

	accepts_nested_attributes_for :profile, :friendslists, :inboxes, :dashboard
	attr_accessible :password, :password_confirmation, :login, :email, :perms
	validates :password, :presence     => true,  
                       :confirmation => true,  
                       :length       => { :within => 6..40 } 

	acts_as_authentic

	alias_method :db_profile, :profile
	def profile
	  self.profile = Profile.create(:user => self) if self.db_profile.nil?
	  self.db_profile
	end


	def setup
		#this function is run before the first save. Prepares all the non-user oriented details.

		#preparing the first inboxes.
		box = Inbox.new
		box.name = "Inbox"
		self.inboxes << box
		outbox = Inbox.new
		outbox.name = "Outbox"
		self.inboxes << outbox

		#preparing the first friendslist
		list = Friendslist.new
		list.name = "All Friends"
		list.parent_id = self.id

		#Preparing blank profile. There is no "new" method in profiles controller.
		self.build_profile
	end

	def recieve_mail(message)
		new_mail = Mail.new(message)
		new_mail.unread = true

		self.inboxes.first << new_mail
		self.inboxes.first.update_attributes(self)
	end

	def admin?
		if perms > 2
			true
		else
			false
		end
	end

	def moderator?
		if perms > 1
			true
		else
			false
		end
	end

end
