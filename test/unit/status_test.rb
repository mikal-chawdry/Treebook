require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "A status cannot be empty" do
    status = Status.new
    assert !status.save
    assert !status.errors[:content].empty?
  end
  
  
  test "Status content is at last 2 letters long" do
    status = Status.new
    status.content = "H"
    assert !status.save
    assert !status.errors[:content].empty?
    assert status.errors[:content].include?("Status must be at least 2 letters long")
  end
  
  test "A status should be associated with a user_id" do
  status = Status.new
  status.content = "Hello"
  status.user_id = nil
  assert !status.save
  assert !status.errors[:user_id].empty?
  end
end
