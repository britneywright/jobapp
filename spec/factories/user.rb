FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Doe"
    email "person@example.com"   
    password "foobar24"
    password_confirmation "foobar24"
  end
end  