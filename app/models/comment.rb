class Comment < ActiveRecord::Base

	belongs_to :story
	validates :body, length: {minimum: 10, maximum: 2000}

end
