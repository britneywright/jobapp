FactoryGirl.define do
	factory :job do
		position "First Job Application"
		company "Company Name"
		date_applied "2014-02-06 19:00:34"
		link "Where did you find this job?"
		description "This is the position description in case it disappears online."
		notes 'These are additional notes about the job that you want to keep top of mind.'
		user_id 1
	end
end