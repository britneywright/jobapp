require 'spec_helper'

describe Interview do
		let(:interview) { FactoryGirl.create(:interview) }

	it { should respond_to(:date) }
	it { should respond_to(:kind) }
	it { should respond_to(:notes)}
	it { should respond_to(:job_id) }
	
end	