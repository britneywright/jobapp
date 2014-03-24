require 'spec_helper'

describe Interview do
	let(:interview) { FactoryGirl.build(:interview) }

	it { should respond_to(:date_interviewed) }
	it { should respond_to(:kind) }
	it { should respond_to(:notes)}
	it { should respond_to(:application_id) }
	
end