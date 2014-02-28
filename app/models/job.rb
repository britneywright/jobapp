class Job < ActiveRecord::Base
	belongs_to :user
	has_many :interviews
  validates :position, presence: true
end	