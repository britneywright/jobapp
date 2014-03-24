FactoryGirl.define do
  factory :user do
    email "person@example.com"   
    password "foobar24"
    password_confirmation "foobar24"

    factory :applications_applied do
      association :applications
    end  
  end
end  