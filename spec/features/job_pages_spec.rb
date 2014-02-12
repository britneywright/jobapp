require 'spec_helper'

describe "single page" do

  subject { page }
  
  context "when user logged in" do
    before do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit job_path(job.attributes)
    end  

    it { should have_selector('h2', text: job.position) }
    it { should have_content(text: job.company) }
    it { should have_content(text: job.date_applied) }
    it { should have_content(text: job.link) }
    it { should have_content(text: job.description) }
    it { should have_content(text: job.notes) }    
    it { should click_link_or_button('Edit') }
    it { should click_link_or_button('Back') }
  end
end

describe "new job page" do
  before { visit new_user_job_path }
  it { should have_content('Track new job application') }
  it { should have_title('Track new job application') }
end

describe "create new job" do
  before { visit new_user_job_path }
  
  let(:submit) { "Create" }

  describe "with invalid information" do
    it "should not create a job" do
      expect { click_button submit }.not_to change(Job, :count)
    end 
  end
end  

describe "with valid information" do
  before do
    fill_in "Position", with: "New Job"
    fill_in "Company", with: "Acme"
    fill_in "Date Applied", with: "01/10/2014"
    fill_in "Link", with: "http://www.example.com"
    fill_in "Description", with: "This is the position description in case it disappears online."
    fill_in "Notes", with: 'These are additional notes about the job that you want to keep top of mind.' 
  end  
  
  it "should create a job" do
    expect { click_button submit }.to change(Job, :count).by(1)
  end    
end

describe "edit" do
  let(:job) { FactoryGirl.create(:job) }
  
  before do 
    sign_in user
    visit edit_job_path(job)            
  end 

  describe "page" do
    it { should have_content("Update job") }
    it { should have_title("Edit job") }
  end
  
  describe "with invalid information" do
    before { click_button "Save changes" }
    it { should have_content('error') }
  end

  describe "with valid information" do
    let(:new_position) { "New Name" }
    let(:new_company) { "Zebra" }
    let(:new_date_applied) { "01/30/2014" }
    let(:new_link) { "http://www.whatever.com" }
    let(:new_description) { "This is the new description" }
    let(:new_notes) { "These are new notes" } 

    before do
      fill_in "Position", with: new_position
      fill_in "Company", with: new_company
      fill_in "Date Applied", with: new_date_applied
      fill_in "Link", with: new_link
      fill_in "Description", with: new_description
      fill_in "Notes", with: new_notes
      click_button "Save changes"
    end
    
    it { should have_title(new_position) }
    it { should have_selector('div.alert.text-success') }
  end
end  