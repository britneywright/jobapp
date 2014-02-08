require 'spec_helper'

describe "User pages" do

	subject { page }

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
		
		before { visit user_path(user) }

		it { should have_content(user.name) }
		it { should have_title(user.name) }
		end
	end

	describe "signup page" do
		before { visit signup_path }

		let(:submit) { "Create my account" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end	
		end

		describe "with valid information" do
			before do
				fill_in "First Name", with: "John"
				fill_in "Last Name", with: "Doe"
				fill_in "Email", with: "user@example.com"
				fill_in "Password", with: "foobar28"
				fill_in "Confirm Password", with: "foobar28"
			end
			
			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
			
			describe "after saving the user" do
				before { click_button submit }
				let(:user) {User.find_by(email: 'user@example.com') }
				
				it { should have_link('Sign out') }
				it { should have_title(user.name) }
				it { should have_selector('div.alert.text-success', text: 'Welcome') }
			end	
		end 		
	end
	
	describe "edit" do
		let(:user) { FactoryGirl.create(:user) }
		before do 
			sign_in user
			visit edit_user_path(user)				  	
		end	

		describe "page" do
			it { should have_content("Update your profile") }
			it { should have_title("Edit profile") }
		end
		describe "with invalid information" do
			before { click_button "Save changes" }

			it { should have_content('error') }
		end

		describe "with valid information" do
			let(:new_firstname) { "Jim" }
			let(:new_firstname) { "Bob" }			
			let(:new_email) { "new@example.com" }
			before do
				fill_in "First Name", with: new_firstname
				fill_in "Last Name", with: new_lastname				
				fill_in "Email", with: new_email
				fill_in "Password", with: user.password
				fill_in "Confirm Password", with: user.password
				click_button "Save changes"
			end
			
			it { should have_title(new_firstname) }
			it { should have_selector('div.alert.text-success') }
			it { should have_link('Sign out', href: signout_path) }
			specify { expect(user.reload.name).to eq new_name }
			specify { expect(user.reload.email).to eq new_email }
		end
end