class Forum < ActiveRecord::Base
	has_many :topics

	validates :title, :presence => true, :length => {:within => 6..40 }
	validates :description, :presence => true, :length => {:within => 25..100 }
end
