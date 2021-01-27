require "test_helper"

class BriefingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @briefing = briefings(:one)
  end

  test "should get index" do
    get briefings_url
    assert_response :success
  end

  test "should get new" do
    get new_briefing_url
    assert_response :success
  end

  test "should create briefing" do
    assert_difference('Briefing.count') do
      post briefings_url, params: { briefing: { name: @briefing.name } }
    end

    assert_redirected_to briefing_url(Briefing.last)
  end

  test "should show briefing" do
    get briefing_url(@briefing)
    assert_response :success
  end

  test "should get edit" do
    get edit_briefing_url(@briefing)
    assert_response :success
  end

  test "should update briefing" do
    patch briefing_url(@briefing), params: { briefing: { name: @briefing.name } }
    assert_redirected_to briefing_url(@briefing)
  end

  test "should destroy briefing" do
    assert_difference('Briefing.count', -1) do
      delete briefing_url(@briefing)
    end

    assert_redirected_to briefings_url
  end
end
