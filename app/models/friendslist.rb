class Friendslist < ActiveRecord::Base
	has_many :users
	belongs_to :user

	#These were built as a model so that there can be expansion in the future. Potentially allowing users to organize thier friendslists.
	#Friendlist[0] is always ALL of the user's friends. Any new ones simply sort them.
end
