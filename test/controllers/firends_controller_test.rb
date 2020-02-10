require 'test_helper'

class FirendsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get firends_index_url
    assert_response :success
  end

  test "should get destroy" do
    get firends_destroy_url
    assert_response :success
  end

end
