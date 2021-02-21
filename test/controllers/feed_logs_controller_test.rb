require "test_helper"

class FeedLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get feed_logs_index_url
    assert_response :success
  end

  test "should get show" do
    get feed_logs_show_url
    assert_response :success
  end
end
