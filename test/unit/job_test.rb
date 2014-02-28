require 'test_helper'

class JobTest < ActiveSupport::TestCase
  def setup
    @j = jobs(:one)
  end

  test "invalid without a position" do
    @j.position = nil
    assert !@j.valid?, "Position is not being validated"
  end  

  test "valid with all atrributes" do
    assert @j.valid?, "Job was not valid"
  end
  
  test "invalid position gives error message" do
    @j.position = nil
    @j.valid?
    assert_match /can't be blank/, @j.errors[:position].join, "Presence error not found on job"
  end

  test "should respond to interviews" do
    assert_respond_to @j, :interviews
  end

  test "should contain only interviews that belong to job" do
    assert @j.interviews.all? {|i| i.job == @j}
  end  
end