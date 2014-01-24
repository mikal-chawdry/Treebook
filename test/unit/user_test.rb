require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "a user should have to enter a first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty? # We want an error to be raised if the user does not enter a first name. When an error occurs, it gets passed to the error object making it not empty. If it is empty, this implies that when a user does not enter their first name, no error is raised. To make test pass, you have to use validation methods in the user model. The errors object is an array
  end
  
  test "a user should have to enter a last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end
  
  test "a user should have to enter a profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end
  
  test "user should have a unique profile name" do
    user = User.new
    user.profile_name = users(:mikal).profile_name
    users(:mikal)
    user.password = "password"
    user.password_confirmation = "password"
    assert !user.save
    puts user.errors.inspect
    assert !user.errors[:profile_name].empty?
  end
  
  test "A user should have a profile name without any spaces" do
    user = User.new
    user.profile_name = "mikal chawdry"
    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("must be formatted correctly")
  end
  
end
