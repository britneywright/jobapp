require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "single page" do

  subject { page }
  
  context "when user logged in" do
    before(:each) do
      user = FactoryGirl.create(:user)
      application = FactoryGirl.create(:application)
      login_as(user, :scope => :user)
      visit application_path(application)
    end  

    it { should have_selector('h2', :position) }
    it { should have_content(:company) }
    it { should have_content(:date_applied) }
    it { should have_content(:link) }
    it { should have_content(:description) }
    it { should have_content(:notes) }
    it { should have_content(:contact_name) }
    it { should have_content(:contact_phone) }
    it { should have_content(:contact_address) }
    it { should have_content(:contact_email) }     
    it { should click_link_or_button('Edit') }
    it { should click_link_or_button('View All Applications') }
  end
end

Warden.test_reset! 

describe "new application page" do

  subject { page }

  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit new_user_application_path(user)
  end

  it { should have_content('Track new job application') }
  it { should have_button('Submit') }
end

Warden.test_reset!

describe "create new application" do
  subject { page }
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit new_user_application_path(user)
  end
  let(:submit) { "Submit" } 

  describe "with valid information" do
    before do
      fill_in "Position", with: "New Application"
      fill_in "Company", with: "Acme"
      fill_in "Date applied", with: "01/10/2014"
      fill_in "Link", with: "http://www.example.com"
      fill_in "Description", with: "This is the position description in case it disappears online."
      fill_in "Notes", with: 'These are additional notes about the application that you want to keep top of mind.' 
      fill_in "Name", with: "Joe Smith"
      fill_in "Address", with: "45 Apple Court"
      fill_in "Phone Number", with: "123-456-7891"
      fill_in "Email", with: "joe@smith.com"
    end    
    it "should create a application" do
      expect { click_button submit }.to change(Application, :count).by(1)
    end    
  end
end

describe "edit" do
  subject { page }
  before(:each) do
    user = FactoryGirl.create(:user)
    application = FactoryGirl.create(:application)
    login_as(user, :scope => :user)
    visit edit_application_path(application)
  end

  describe "page" do
    it { should have_selector('h1', 'Edit Application Info') }    
  end
  
  describe "with invalid information" do
    before { click_button "Submit" }
  end

  describe "with valid information" do
    let(:new_position) { "New Name" }
    let(:new_company) { "Zebra" }
    let(:new_date_applied) { "01/30/2014" }
    let(:new_link) { "http://www.whatever.com" }
    let(:new_description) { "This is the new description" }
    let(:new_notes) { "These are new notes" }
    let(:new_contact_name) { "Jane Smith" }
    let(:new_contact_address) { "123 Lane Lane, Columbus, OH" }
    let(:new_contact_phone) { "555-123-4567" }
    let(:new_contact_email) { "jane@smith.com" } 

    before do
      fill_in "Position", :with => new_position
      fill_in "Company", with: new_company
      fill_in "Date applied", with: new_date_applied
      fill_in "Link", with: new_link
      fill_in "Description", with: new_description
      fill_in "Notes", with: new_notes
      fill_in "Contact Name", with: new_contact_name
      fill_in "Contact Address", with: new_contact_address
      fill_in "Contact Phone", with: new_contact_phone
      fill_in "Contact Email", with: new_contact_email  
      click_button "Submit"
    end
  end
end  