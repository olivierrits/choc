require 'test_helper'

class BarsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bars_index_url
    assert_response :success
  end

  test "should get show" do
    get bars_show_url
    assert_response :success
  end

end
