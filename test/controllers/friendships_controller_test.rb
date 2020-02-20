require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    assert_redirected_to users_path(User.First)
  end
  # test "the truth" do
  #   assert true
  # end
end
