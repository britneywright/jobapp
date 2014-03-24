FactoryGirl.define do
	factory :application do
		position "First Job Application"
		company "Company Name"
		date_applied "2014-02-06"
		link "Where did you find this job?"
		description "This is the position description in case it disappears online."
		notes 'These are additional notes about the job that you want to keep top of mind.'
		user_id 1
    contact_name "John Smith"
    contact_address "112 Monroe St. Rockville, MD 20850"
    contact_phone "520-250-8037"
    contact_email "john@smith.com"
	end
end