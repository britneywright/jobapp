require 'spec_helper'

describe "Static pages" do
  
  subject { page }
  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: "heading") }
    it { should have_title(full_title(page_title)) }
  end
    
  describe "Home page" do
    before { visit root_path }

  	let(:heading) { 'Welcome to' }
    let(:page_title) { '' }

    it { should_not have_title('| Home')}

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        sign_in user
        visit root_path
      end
    end
  end    
end      