class Story < ActiveRecord::Base

#can be length, unique, etc. this is wheere you 'model' your objects

# http://guides.rubyonrails.org/active_record_basics.html#validations
# http://api.rubyonrails.org/ search "validates"

	validates :title, presence: true
	validates :body, presence: true
	validates :url, presence: true, uniqueness: true

	has_many :comments
	has_many :votes

end
