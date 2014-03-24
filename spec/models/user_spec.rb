require 'spec_helper'

describe User do
	let(:user) { FactoryGirl.build(:user) }

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:admin) }
end  