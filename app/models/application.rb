class Application < ActiveRecord::Base
  belongs_to :user
  has_many :interviews, :dependent => :destroy
  validates :position, presence: true
end 