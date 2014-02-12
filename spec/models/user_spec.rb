require 'spec_helper'

describe User do
  before do 
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end 

  it { should respond_to(:first_name) }
  it { should respond_to(:lastname) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:admin) }
end
