require 'spec_helper'

describe Job do
	before do
		let(:job) { FactoryGirl.create(:job) }
	end

	it { should respond_to(:position) }
	it { should respond_to(:company) }
	it { should respond_to(:date_applied)}
	it { should respond_to(:link)}
	it { should respond_to(:description) }
	it { should respond_to(:notes)}
	it { should respond_to(:user_id) }

end