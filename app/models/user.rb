class User < ApplicationRecord
	validates_uniqueness_of :username
	scope :all_except,->(user){where.not(id: user)}

	#any instance added to this instance model should be broadcasted in the users channel
	after_create_commit {broadcast_append_to "users"}
	has_many :messages
end
