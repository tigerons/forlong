require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end
  test "user exist?" do
    get users_url(@user)
    assert_response :success
  end
  # test "the truth" do
  #   assert true
  # end
end
