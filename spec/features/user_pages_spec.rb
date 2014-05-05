require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "signup page" do
  subject { page }
  before { visit new_user_registration_path }

  let(:submit) { "Sign up" }

  describe "with invalid information" do
    it "should not create a user" do
      expect { click_button submit }.not_to change(User, :count)
    end 
  end

  describe "with valid information" do
    before do
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "foobar28"
      fill_in "Password confirmation", with: "foobar28"
    end
    
    it "should create a user" do
      expect { click_button submit }.to change(User, :count).by(1)
    end
    
    describe "after saving the user" do
      before { click_button submit }
      let(:user) {User.find_by(email: 'user@example.com') }
      
      it { should have_link('Logout') }
    end 
  end     
end
  
describe "edit" do
  subject { page }
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit edit_user_registration_path(user)           
  end 

  describe "page" do
    it { should have_content("Edit User") }
  end

  describe "with valid information" do  
    let(:new_email) { "new@example.com" }
    before do     
      fill_in "Email", with: new_email
      fill_in "Password", with: :password
      fill_in "Password confirmation", with: :password_confirmation
      click_button "Update"
    end
    
    it { should have_link('Logout') }
  end
end