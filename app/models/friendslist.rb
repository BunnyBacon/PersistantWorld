class Friendslist < ActiveRecord::Base
	has_and_belongs_to_many :users

	#These were built as a model so that there can be expansion in the future. Potentially allowing users to organize thier friendslists.
	#Friendlist[0] is always ALL of the user's friends. Any new ones simply sort them.
end
