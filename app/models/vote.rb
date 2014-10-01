class Vote < ActiveRecord::Base

	# Add counter cache for liking things
	belongs_to :story, counter_cache: true

	#people can only vote once
	validates :ip_address, uniqueness: { scope: :story_id }
	
end
