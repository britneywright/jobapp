class Interview < ActiveRecord::Base
  belongs_to :application
  validates :date_interviewed, presence: true
end
