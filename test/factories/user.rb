FactoryGirl.define do
  factory :user do
    email "person@example.com"   
    password "foobar24"
    password_confirmation "foobar24"

    factory :jobs_applied do
      association :jobs
    end  
  end
end  