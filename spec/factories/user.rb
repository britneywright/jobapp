FactoryGirl.define do
  factory :user do
    id 1
    email "person@example.com"   
    password "foobar24"
    password_confirmation "foobar24"
  end
end  