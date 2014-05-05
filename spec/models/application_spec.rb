require 'spec_helper'

describe Application do
  let(:application) { FactoryGirl.build(:application) }

  it { should respond_to(:position) }
  it { should respond_to(:company) }
  it { should respond_to(:date_applied)}
  it { should respond_to(:link)}
  it { should respond_to(:description) }
  it { should respond_to(:notes)}
  it { should respond_to(:user_id) }
  it { should respond_to(:contact_name) }
  it { should respond_to(:contact_phone) }
  it { should respond_to(:contact_address) }
  it { should respond_to(:contact_email) }
end