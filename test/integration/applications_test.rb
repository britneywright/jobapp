require 'test_helper'

class ApplicationsTest < ActionDispatch::IntegrationTest

  test "Single application page navigation" do
    visit root_path
    click_link("Sign Up", match: :first)
    assert_equal new_user_registration_path, current_path  
  end

  test "Sign in from home page" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link("Login")
    assert_equal '/users/sign_in', current_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on("Sign in")
    assert_equal root_path, current_path
    click_on("View Applications")
    assert_equal user_applications_path(user), current_path
  end
    
end