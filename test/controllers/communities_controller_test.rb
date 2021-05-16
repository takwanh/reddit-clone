require "test_helper"

class CommunitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get communities_new_url
    assert_response :success
  end

  test "should get index" do
    get communities_index_url
    assert_response :success
  end
end
